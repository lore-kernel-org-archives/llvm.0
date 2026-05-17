Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D416A30EF94;
	Sun, 17 May 2026 21:25:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779053157; cv=none; b=MfE+Z9flyDFhOfpvVeYJZQnWyL3mkKPY1NwLCjTNkhr8bg2gPwRypEoKjo8X5JmhNKK8Nn2LTU/waS0ILSjH4289GQeCCmIto3AhKiRztEw1dtKaJZm03i80TKQrAvr0Botc0ji9LYiKc/pXBPLGrx77af9dzChLEltfsonkYfM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779053157; c=relaxed/simple;
	bh=HFRITgFGYQVYblgoG8PXv63O6UhzlQojd5cPPmn7EVc=;
	h=Date:From:To:Cc:Subject:Message-ID; b=NXmZtVBhXDFeSI7KtTBSC7yVUFmW6Kj1YCzKRgu3mSDIiBe/cxevux213oq21eiuvcX2eyKUJlUHtSK8Q9AH0FNfShMmPwxf2pzwYSBpofw6BQ+YC/FouhaPXT7rHhh/t/OxAHmy7Zpv1NA8nWj1HbA6hXzRAJyqiM1hV/ombLA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bDFwRE2y; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bDFwRE2y"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779053155; x=1810589155;
  h=date:from:to:cc:subject:message-id;
  bh=HFRITgFGYQVYblgoG8PXv63O6UhzlQojd5cPPmn7EVc=;
  b=bDFwRE2ypLzyOn41i9VhguIGDDhoHSHPxd8pA7jEF/9Z7vBnUgPNFWd7
   6zk9R7l6OQn5FTV9sqAkZCXrG5fACmmey2AmKWpSxl36SJ7LnciaYXo+6
   Xn90qIrf190gUgCEL+YMYJDgWrk39+59qs4tKjK9DxS9kn9mtO7RJP9se
   oXuiZa0dUjtBmDsLl6SKAOO9QkDiE6AjMJ8crgNj1p8sAzpfljg+x8kPn
   xSHgjQYGclHchONvHBHbo7b2+rCs/QaTKpNRj2B01hVGo7OCuDIcwUE8m
   Zkm665cE47fwEKXIkbLUWjBc1CTpkFd0qKkN071ubl+P3eyLIjZgEmmuY
   g==;
X-CSE-ConnectionGUID: n1Tw1r3yQ3aNPxP5kcn1qw==
X-CSE-MsgGUID: NhHjIJFhRNudMI2biz8K7g==
X-IronPort-AV: E=McAfee;i="6800,10657,11789"; a="83782329"
X-IronPort-AV: E=Sophos;i="6.23,240,1770624000"; 
   d="scan'208";a="83782329"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 May 2026 14:25:54 -0700
X-CSE-ConnectionGUID: uXjE01aJSnGiV5TlnZy2hg==
X-CSE-MsgGUID: 4mgDq6gTQgClqSpjBZJXZQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,240,1770624000"; 
   d="scan'208";a="234787114"
Received: from lkp-server01.sh.intel.com (HELO d94e5e629b2d) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 17 May 2026 14:25:52 -0700
Received: from kbuild by d94e5e629b2d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wOize-000000001xO-0ZSZ;
	Sun, 17 May 2026 21:25:50 +0000
Date: Mon, 18 May 2026 05:24:54 +0800
From: kernel test robot <lkp@intel.com>
To: Daniel J Blueman <daniel@quora.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 Rob Clark <robin.clark@oss.qualcomm.com>
Subject: [drm-msm:msm-next 9/11]
 drivers/gpu/drm/msm/msm_gem_shrinker.c:105:58: warning: omitting the
 parameter name in a function definition is a C23 extension
Message-ID: <202605180535.PJsAYeaG-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://gitlab.freedesktop.org/drm/msm.git msm-next
head:   db339b6bc9f234b4883eb02946ea01d8d9faa11c
commit: 3392291fc509d8ad6e4ad90f15b0a193f721cbc9 [9/11] drm/msm: Fix shrinker deadlock
config: arm-defconfig (https://download.01.org/0day-ci/archive/20260518/202605180535.PJsAYeaG-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project 5bac06718f502014fade905512f1d26d578a18f3)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260518/202605180535.PJsAYeaG-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605180535.PJsAYeaG-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/gpu/drm/msm/msm_gem_shrinker.c:105:58: warning: omitting the parameter name in a function definition is a C23 extension [-Wc23-extensions]
     105 | purge(struct drm_gem_object *obj, struct ww_acquire_ctx *)
         |                                                          ^
   drivers/gpu/drm/msm/msm_gem_shrinker.c:117:58: warning: omitting the parameter name in a function definition is a C23 extension [-Wc23-extensions]
     117 | evict(struct drm_gem_object *obj, struct ww_acquire_ctx *)
         |                                                          ^
   2 warnings generated.


vim +105 drivers/gpu/drm/msm/msm_gem_shrinker.c

   103	
   104	static bool
 > 105	purge(struct drm_gem_object *obj, struct ww_acquire_ctx *)
   106	{
   107		if (!is_purgeable(to_msm_bo(obj)))
   108			return false;
   109	
   110		if (msm_gem_active(obj))
   111			return false;
   112	
   113		return with_vm_locks(msm_gem_purge, obj);
   114	}
   115	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
