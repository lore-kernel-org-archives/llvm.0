Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5294F1BC4F;
	Wed, 26 Jun 2024 02:01:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719367275; cv=none; b=Xrgqz+TQ0rvXZTeVdoscnYv0YCyNt5uBXWNB1pvhEe+dZZMs+YMEUlJ2EyQyYk6cGsL2aN0455vBXXdN0zrlVFZNATRLK9uT+c350EL8ENByUS8PhxBDT/0h6WLmrtI7OqblSYTGzNyrImmI9jv5ACcU6wJHzkC05E2/tUKDTMw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719367275; c=relaxed/simple;
	bh=+n2QMA6KNRTTJgkpEvvnTDcrmZowd8hIu4Hn2FEgfhk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=PmugcIwyTm3MTvDlu3hBKlxK/BjEss9af6nvH5BNhVOfrC/SdZdF3X6kSxdUJjnTeGYdLwLUwQdHuAgaOzaQegzVemMt39yo+60F/uujW3m6GQZSLTuXwbxYddv8jz598cN6lggH+pKITSW+71/IYFFRkqH487eEjYwT8XIlxAM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Od9HTW+A; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Od9HTW+A"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1719367274; x=1750903274;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=+n2QMA6KNRTTJgkpEvvnTDcrmZowd8hIu4Hn2FEgfhk=;
  b=Od9HTW+A9IChglL5nIVHK5lCCusVODD6pq1snyi4Q5o49WOxSng+R7XY
   df5nY4CBN4Us9vUogLxTdWCSlt7aeP4GF9wd58LOovbo9xn1DIsoy9AnP
   wGqRwJFWxiCGlXrXw7bjH6mm2nzy+d2qu+XRmw5/1ad82CLKHkIQDJI5E
   YWU3bU1ae2725gTWOg+L3dZGMzsMoeD4nKWjDJowG1jFLzkLFnP+CNuCH
   4MRKNu4pjYvsV9kbH/PFtVOaaiygviHHZv8ZvWGsbEkff68iCq6Ysl1KG
   yQeZw9IF5occMMHlka5vQGo+vNG8T1/KhDGio3EqC9j7T8upSyLvP7i2M
   g==;
X-CSE-ConnectionGUID: MO9I1XSWSNy2+pG1tqFx7A==
X-CSE-MsgGUID: 3oFG39CwRnmqCKdJPBvCVg==
X-IronPort-AV: E=McAfee;i="6700,10204,11114"; a="27008036"
X-IronPort-AV: E=Sophos;i="6.08,265,1712646000"; 
   d="scan'208";a="27008036"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Jun 2024 19:01:14 -0700
X-CSE-ConnectionGUID: GoA11gVMS0+ta9Qlzk/mxA==
X-CSE-MsgGUID: FcKVFX9ISVSpvJfYsS0DCQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,265,1712646000"; 
   d="scan'208";a="48289879"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 25 Jun 2024 19:01:12 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sMHyA-000Et8-0k;
	Wed, 26 Jun 2024 02:01:10 +0000
Date: Wed, 26 Jun 2024 10:00:59 +0800
From: kernel test robot <lkp@intel.com>
To: Rob Clark <robdclark@chromium.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Mark Brown <broonie@kernel.org>
Subject: [linux-next:master 7925/8016]
 drivers/gpu/drm/msm/adreno/a6xx_catalog.c:1232:20: error: unused function
 '__build_asserts'
Message-ID: <202406260958.0fb7w9Xu-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   0fc4bfab2cd45f9acb86c4f04b5191e114e901ed
commit: a4e9946f4bc0dcb8c404b00f6f8cab3623f82278 [7925/8016] Merge branch 'msm-next' of https://gitlab.freedesktop.org/drm/msm.git
config: arm64-randconfig-002-20240626 (https://download.01.org/0day-ci/archive/20240626/202406260958.0fb7w9Xu-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project ad79a14c9e5ec4a369eed4adf567c22cc029863f)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240626/202406260958.0fb7w9Xu-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406260958.0fb7w9Xu-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/gpu/drm/msm/adreno/a6xx_catalog.c:1232:20: error: unused function '__build_asserts' [-Werror,-Wunused-function]
    1232 | static inline void __build_asserts(void)
         |                    ^~~~~~~~~~~~~~~
   1 error generated.


vim +/__build_asserts +1232 drivers/gpu/drm/msm/adreno/a6xx_catalog.c

fccf9dd00893ef Rob Clark 2024-06-18  1231  
fccf9dd00893ef Rob Clark 2024-06-18 @1232  static inline void __build_asserts(void)

:::::: The code at line 1232 was first introduced by commit
:::::: fccf9dd00893eff49d3a86b43280fd2ab8736298 drm/msm/adreno: Move CP_PROTECT settings to hw catalog

:::::: TO: Rob Clark <robdclark@chromium.org>
:::::: CC: Rob Clark <robdclark@chromium.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
