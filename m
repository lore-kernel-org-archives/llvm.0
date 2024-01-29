Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A0C0266D4;
	Mon, 29 Jan 2024 22:18:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706566700; cv=none; b=dbIiS9T6FEEoljScWi0c1j5p3ItAqjWEPjLB88fSMWZV63DCQejDwzQAFmIjVpiA5CT50s+hsdgzuUU4s34UEcQ821I0iz/5JAXHxzWxIgRGHqoBkUjALC6Onx9YNTJUOZK4dBBvJzOFaMTOFArnsIyt4OnXy+zX/hbHurKD7zc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706566700; c=relaxed/simple;
	bh=Cyx0x5nfBLUf3epzS3OnwiMxzAgCq2uQLW4m3QcYR2I=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=NFWSqHbgs7ZhDsXXe31nzLI6dtif3eU4fzxTE95huC8rsrSeQ76VGKnUIZOnPH9yUypOoYuZQESNnO8hlGhhgYV4n1Jp9alv0F9qtIbOCKI+0nkRYbjDoaPTQjum2TTTkLCvwl6VFVQfgcqczoiRcHt60MQsDi9PhqZhAzKmNq0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=S1D2LKVR; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="S1D2LKVR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1706566700; x=1738102700;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Cyx0x5nfBLUf3epzS3OnwiMxzAgCq2uQLW4m3QcYR2I=;
  b=S1D2LKVROmQ8QfmIXCWJYPzw5b3n940fN50PCzAShtyUL60ZsR+hKT93
   IWYUmUYLk5VpvXr+Gz9waZQEubFFE65pIbDHpNT4Q600RTAOrNEng59C8
   sM83UAxkWiHcSqIKJc7uHiEriH1yjAESJ73azG5EuuvcgJkYMfQZkEEJ9
   IHAhbska/gpjBFpx3dV7V5nCA5+PQDIT2s2ZgbGfXS7U5cofySe+B0/XR
   4mAonu59+09bv6oY7gwTw30bulh0VezNDaB+zKhVBgoTiA79WqE+/wbtG
   bJlBBih6KmVuTBUwZZK1LfbSNZHxk9S5t3D7dnc0SK1L+ydBSpCBm7X/c
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10968"; a="9741738"
X-IronPort-AV: E=Sophos;i="6.05,227,1701158400"; 
   d="scan'208";a="9741738"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jan 2024 14:18:19 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,227,1701158400"; 
   d="scan'208";a="3509974"
Received: from lkp-server01.sh.intel.com (HELO 370188f8dc87) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 29 Jan 2024 14:18:16 -0800
Received: from kbuild by 370188f8dc87 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rUZxG-0004fk-0Q;
	Mon, 29 Jan 2024 22:18:14 +0000
Date: Tue, 30 Jan 2024 06:17:15 +0800
From: kernel test robot <lkp@intel.com>
To: Christian Brauner <brauner@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Christian Brauner <christianvanbrauner@gmail.com>
Subject: [brauner-vfs:b4/vfs-bdev-file-bd_inode 35/37]
 drivers/gpu/drm/drm_gem_vram_helper.c:938:28: error: call to undeclared
 function 'drm_vram_mm_obdev_file'; ISO C99 and later do not support implicit
 function declarations
Message-ID: <202401300654.iAb8gaWk-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/vfs/vfs.git b4/vfs-bdev-file-bd_inode
head:   92279a7f8c418cb71e6fb335e4af2c7565944a11
commit: d8db7fccf2cac31fb2021ddc1dc989d2c878099d [35/37] fs & block: remove bdev->bd_inode
config: powerpc-allmodconfig (https://download.01.org/0day-ci/archive/20240130/202401300654.iAb8gaWk-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project 4a39d08908942b2d415db405844cbe4af73e75d4)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240130/202401300654.iAb8gaWk-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202401300654.iAb8gaWk-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/gpu/drm/drm_gem_vram_helper.c:938:28: error: call to undeclared function 'drm_vram_mm_obdev_file'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     938 |         struct drm_vram_mm *vmm = drm_vram_mm_obdev_file(bdev);
         |                                   ^
   drivers/gpu/drm/drm_gem_vram_helper.c:938:28: note: did you mean 'drm_vram_mm_of_bdev'?
   include/drm/drm_gem_vram_helper.h:195:35: note: 'drm_vram_mm_of_bdev' declared here
     195 | static inline struct drm_vram_mm *drm_vram_mm_of_bdev(
         |                                   ^
>> drivers/gpu/drm/drm_gem_vram_helper.c:938:22: error: incompatible integer to pointer conversion initializing 'struct drm_vram_mm *' with an expression of type 'int' [-Wint-conversion]
     938 |         struct drm_vram_mm *vmm = drm_vram_mm_obdev_file(bdev);
         |                             ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   2 errors generated.


vim +/drm_vram_mm_obdev_file +938 drivers/gpu/drm/drm_gem_vram_helper.c

   934	
   935	static int bo_driver_io_mem_reserve(struct ttm_device *bdev,
   936					    struct ttm_resource *mem)
   937	{
 > 938		struct drm_vram_mm *vmm = drm_vram_mm_obdev_file(bdev);
   939	
   940		switch (mem->mem_type) {
   941		case TTM_PL_SYSTEM:	/* nothing to do */
   942			break;
   943		case TTM_PL_VRAM:
   944			mem->bus.offset = (mem->start << PAGE_SHIFT) + vmm->vram_base;
   945			mem->bus.is_iomem = true;
   946			mem->bus.caching = ttm_write_combined;
   947			break;
   948		default:
   949			return -EINVAL;
   950		}
   951	
   952		return 0;
   953	}
   954	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
