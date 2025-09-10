Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01D88224AF3;
	Wed, 10 Sep 2025 23:16:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757546181; cv=none; b=k5jLuhesJH8QscYgmiV85kmInKW8MrEMVmUq097OoHZkiebwTzfXtcOPwytUcjUUVQnGXLtD8tPxHgIJ78702CP487kmuQIwpckmLcD67qf5Y+G2rpTlFE9xEGTMQLhQr0e3uMZc7pVY6owHOKi2RulhQWKpGlundttHyEOROvE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757546181; c=relaxed/simple;
	bh=9aOxjr11JbWeRsCcuR3pvqpQ2x8opRYC+Cx28BGCnS8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=CfZsixvaeuQRKCz36hNsvymbSuXmhGwm83yEB6++mY0XGTBvkyM50//8mAEnDgcYc17jvXsc1o3PZAtI0tBU5uD3aooYhpmx5gAZkyTj1HHfaXJg1BwyQAgfLOn5/1RECxogpvdqHU7Uz3d3WG47f39oVdHRe80M6hY/zVnH/YM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CHK1Mf5r; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CHK1Mf5r"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1757546180; x=1789082180;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=9aOxjr11JbWeRsCcuR3pvqpQ2x8opRYC+Cx28BGCnS8=;
  b=CHK1Mf5rW2jplDmoE+5HnoF70K3aLmWpopsv+RwBL/GOZRKBtV2mpU94
   PxB0daHPz80GtapndR5OUKyilJNU/QR7z2Hz/DfL3XpP2D11xw3JIIPKm
   sICLDNKTFdbBTFdOw3e/FKaBF+X48Htp9P4lDkPzwnquU25txgh/VCERJ
   +o5405aIthFX4MLUfcJQdezie/UuaV9zc9UNC+JVJr0aBI6AZda7pZFP/
   CXqqslkFgEdqDtmb/IXgdDheu0oE5TAMN7g+GK+hBGFxdwwHHLCGrdGUb
   SbdiRUHrM1N2hxcxwTJ3HaySVLcQwSYMtMCIlJIu8VR/rFdJFbvXmcIa4
   Q==;
X-CSE-ConnectionGUID: NZqCYsJMTSKsRQF0zTRrgw==
X-CSE-MsgGUID: l9UG1oXGShGsxiWqemYpXw==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="63699084"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="63699084"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Sep 2025 16:16:17 -0700
X-CSE-ConnectionGUID: eDasrrH0RdSrYgdw1txesg==
X-CSE-MsgGUID: iitMak+ISfKDFegrY6t8NA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,255,1751266800"; 
   d="scan'208";a="173429375"
Received: from lkp-server01.sh.intel.com (HELO 114d98da2b6c) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 10 Sep 2025 16:16:15 -0700
Received: from kbuild by 114d98da2b6c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uwU2v-0006Lx-0k;
	Wed, 10 Sep 2025 23:16:13 +0000
Date: Thu, 11 Sep 2025 07:15:43 +0800
From: kernel test robot <lkp@intel.com>
To: Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	intel-xe@lists.freedesktop.org,
	Matthew Brost <matthew.brost@intel.com>
Subject: [drm-xe:drm-xe-next 12/13]
 drivers/gpu/drm/xe/compat-i915-headers/gem/i915_gem_stolen.h:46:9: warning:
 variable 'err' is uninitialized when used here
Message-ID: <202509110707.feCc83AG-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

tree:   https://gitlab.freedesktop.org/drm/xe/kernel.git drm-xe-next
head:   844150c255c94230aec41f88db8e2875cb97439e
commit: 1f1541720f651727591411e68c16299de0447b43 [12/13] drm/xe: Rework instances of variants of xe_bo_create_locked()
config: loongarch-allmodconfig (https://download.01.org/0day-ci/archive/20250911/202509110707.feCc83AG-lkp@intel.com/config)
compiler: clang version 19.1.7 (https://github.com/llvm/llvm-project cd708029e0b2869e80abe31ddb175f7c35361f90)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250911/202509110707.feCc83AG-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202509110707.feCc83AG-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/gpu/drm/i915/display/intel_fbc.c:47:
>> drivers/gpu/drm/xe/compat-i915-headers/gem/i915_gem_stolen.h:46:9: warning: variable 'err' is uninitialized when used here [-Wuninitialized]
      46 |         return err;
         |                ^~~
   drivers/gpu/drm/xe/compat-i915-headers/gem/i915_gem_stolen.h:25:9: note: initialize the variable 'err' to silence this warning
      25 |         int err;
         |                ^
         |                 = 0
   1 warning generated.


vim +/err +46 drivers/gpu/drm/xe/compat-i915-headers/gem/i915_gem_stolen.h

c5a2eadd729ba3 drivers/gpu/drm/xe/compat-i915-headers/i915_gem_stolen.h     Jouni Högander      2023-09-13  18  
c5a2eadd729ba3 drivers/gpu/drm/xe/compat-i915-headers/i915_gem_stolen.h     Jouni Högander      2023-09-13  19  static inline int i915_gem_stolen_insert_node_in_range(struct xe_device *xe,
c5a2eadd729ba3 drivers/gpu/drm/xe/compat-i915-headers/i915_gem_stolen.h     Jouni Högander      2023-09-13  20  						       struct i915_stolen_fb *fb,
c5a2eadd729ba3 drivers/gpu/drm/xe/compat-i915-headers/i915_gem_stolen.h     Jouni Högander      2023-09-13  21  						       u32 size, u32 align,
c5a2eadd729ba3 drivers/gpu/drm/xe/compat-i915-headers/i915_gem_stolen.h     Jouni Högander      2023-09-13  22  						       u32 start, u32 end)
c5a2eadd729ba3 drivers/gpu/drm/xe/compat-i915-headers/i915_gem_stolen.h     Jouni Högander      2023-09-13  23  {
c5a2eadd729ba3 drivers/gpu/drm/xe/compat-i915-headers/i915_gem_stolen.h     Jouni Högander      2023-09-13  24  	struct xe_bo *bo;
c5a2eadd729ba3 drivers/gpu/drm/xe/compat-i915-headers/i915_gem_stolen.h     Jouni Högander      2023-09-13  25  	int err;
62742d12663145 drivers/gpu/drm/xe/compat-i915-headers/i915_gem_stolen.h     Lucas De Marchi     2024-03-22  26  	u32 flags = XE_BO_FLAG_PINNED | XE_BO_FLAG_STOLEN;
c5a2eadd729ba3 drivers/gpu/drm/xe/compat-i915-headers/i915_gem_stolen.h     Jouni Högander      2023-09-13  27  
48b1f11c95e8c9 drivers/gpu/drm/xe/compat-i915-headers/i915_gem_stolen.h     Matthew Auld        2024-04-12  28  	if (start < SZ_4K)
48b1f11c95e8c9 drivers/gpu/drm/xe/compat-i915-headers/i915_gem_stolen.h     Matthew Auld        2024-04-12  29  		start = SZ_4K;
48b1f11c95e8c9 drivers/gpu/drm/xe/compat-i915-headers/i915_gem_stolen.h     Matthew Auld        2024-04-12  30  
48b1f11c95e8c9 drivers/gpu/drm/xe/compat-i915-headers/i915_gem_stolen.h     Matthew Auld        2024-04-12  31  	if (align) {
8ea8c918e7dbd5 drivers/gpu/drm/xe/compat-i915-headers/i915_gem_stolen.h     Vinod Govindapillai 2024-01-12  32  		size = ALIGN(size, align);
48b1f11c95e8c9 drivers/gpu/drm/xe/compat-i915-headers/i915_gem_stolen.h     Matthew Auld        2024-04-12  33  		start = ALIGN(start, align);
48b1f11c95e8c9 drivers/gpu/drm/xe/compat-i915-headers/i915_gem_stolen.h     Matthew Auld        2024-04-12  34  	}
8ea8c918e7dbd5 drivers/gpu/drm/xe/compat-i915-headers/i915_gem_stolen.h     Vinod Govindapillai 2024-01-12  35  
1f1541720f6517 drivers/gpu/drm/xe/compat-i915-headers/gem/i915_gem_stolen.h Thomas Hellström    2025-09-08  36  	bo = xe_bo_create_pin_range_novm(xe, xe_device_get_root_tile(xe),
1f1541720f6517 drivers/gpu/drm/xe/compat-i915-headers/gem/i915_gem_stolen.h Thomas Hellström    2025-09-08  37  					 size, start, end, ttm_bo_type_kernel, flags);
c5a2eadd729ba3 drivers/gpu/drm/xe/compat-i915-headers/i915_gem_stolen.h     Jouni Högander      2023-09-13  38  	if (IS_ERR(bo)) {
c5a2eadd729ba3 drivers/gpu/drm/xe/compat-i915-headers/i915_gem_stolen.h     Jouni Högander      2023-09-13  39  		err = PTR_ERR(bo);
c5a2eadd729ba3 drivers/gpu/drm/xe/compat-i915-headers/i915_gem_stolen.h     Jouni Högander      2023-09-13  40  		bo = NULL;
c5a2eadd729ba3 drivers/gpu/drm/xe/compat-i915-headers/i915_gem_stolen.h     Jouni Högander      2023-09-13  41  		return err;
c5a2eadd729ba3 drivers/gpu/drm/xe/compat-i915-headers/i915_gem_stolen.h     Jouni Högander      2023-09-13  42  	}
c5a2eadd729ba3 drivers/gpu/drm/xe/compat-i915-headers/i915_gem_stolen.h     Jouni Högander      2023-09-13  43  
c5a2eadd729ba3 drivers/gpu/drm/xe/compat-i915-headers/i915_gem_stolen.h     Jouni Högander      2023-09-13  44  	fb->bo = bo;
c5a2eadd729ba3 drivers/gpu/drm/xe/compat-i915-headers/i915_gem_stolen.h     Jouni Högander      2023-09-13  45  
c5a2eadd729ba3 drivers/gpu/drm/xe/compat-i915-headers/i915_gem_stolen.h     Jouni Högander      2023-09-13 @46  	return err;
c5a2eadd729ba3 drivers/gpu/drm/xe/compat-i915-headers/i915_gem_stolen.h     Jouni Högander      2023-09-13  47  }
c5a2eadd729ba3 drivers/gpu/drm/xe/compat-i915-headers/i915_gem_stolen.h     Jouni Högander      2023-09-13  48  

:::::: The code at line 46 was first introduced by commit
:::::: c5a2eadd729ba3538f77ea2e055ca1f2efe82092 drm/xe/display: Xe stolen memory handling for fbc support

:::::: TO: Jouni Högander <jouni.hogander@intel.com>
:::::: CC: Rodrigo Vivi <rodrigo.vivi@intel.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
