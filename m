Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBC2D305044;
	Thu,  6 Nov 2025 08:57:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762419423; cv=none; b=X8NXq98s6VN2btrNqfjjYEzpu1h8I7Tn4IOk7Zy8XlnIMh6jq0fvBpbU0/1JGrUz6HxEfQT5BBNKT7gJxZiu3DJkBHPvT4fPQuedsQ8F8xq3yyBP08bfxUf3tpFg/ghFlryzos5lAeE5KmFYUlg1/E1BguHFwsziLQP38xpPWGg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762419423; c=relaxed/simple;
	bh=aQg/C6oXUX/uq+W/35HkP5IokMhK7EBtRMCxsBW5lF4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=NjF5VOxWZh64Xd1pCAjYVyduVriHHxf930Oqssmsuh9YGhfsTiixeOqzXydfiaFh8/MLnb2MHe/qTPlz6+49IGGvRSdTBZzYZG4e9v9iG5kjRz0ydZtZ2s9OjUhiq91JyX9c6K6VPagKu1sswfdsQTdXMF2oWdVCCBbiYqo5EPQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UzLEqe0h; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UzLEqe0h"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1762419423; x=1793955423;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=aQg/C6oXUX/uq+W/35HkP5IokMhK7EBtRMCxsBW5lF4=;
  b=UzLEqe0h8OXQk5TGB/Xl1smlfcNEzPMbABgo0hIyw8Jhb3wWXIOqg7/k
   U8IgDVzRtehdJli8sUGLsPZuqLzVjmsbzN4P5UBStFs821BkDQ+IyXr1H
   IvWUD6f33vlyj5MYoru/wMaICARQI92nijRrOSUPvcD0RzJ7l76vq1i6z
   97jGsQ+NMWOUBMvbEQgJ01WMuoU/oHmdc8VTglyHEH7eFk6HCXyRGdE7Q
   eSCj3q0k5eDlpqKpv+vhss3iiO6m8pnN7kTyG4WgHPSJeLpx9IBv14rE0
   dEIc4LzR2AOtXIIvzBj70IxGQlX3z0zZE7O6+38YvxxlcL5EdSsjuzVYR
   w==;
X-CSE-ConnectionGUID: b9lGIh/URFaB7FIi+Ws81A==
X-CSE-MsgGUID: m2sNmsN8QyGNIeL4go77IA==
X-IronPort-AV: E=McAfee;i="6800,10657,11604"; a="68201001"
X-IronPort-AV: E=Sophos;i="6.19,284,1754982000"; 
   d="scan'208";a="68201001"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Nov 2025 00:57:01 -0800
X-CSE-ConnectionGUID: +RK5Vu/FQQq2pv4jGCN6KQ==
X-CSE-MsgGUID: FeFkI5V6TOyfmcVT+3iv0g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,284,1754982000"; 
   d="scan'208";a="186954637"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by orviesa006.jf.intel.com with ESMTP; 06 Nov 2025 00:56:57 -0800
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vGvnU-000TgE-0R;
	Thu, 06 Nov 2025 08:56:49 +0000
Date: Thu, 6 Nov 2025 16:56:06 +0800
From: kernel test robot <lkp@intel.com>
To: Jonathan Corbet <corbet@lwn.net>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [linux-next:master 6703/6818] Warning:
 arch/arm/mm/dma-mapping.c:1405 expecting prototype for
 arm_iommu_unmap_page(). Prototype was for arm_iommu_unmap_phys() instead
Message-ID: <202511061613.whODAEJk-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   df5d79720b152e7ff058f11ed7e88d5b5c8d2a0c
commit: 0d0f6cd98c646b34bd754e062f3350c14651c91f [6703/6818] Merge branch 'docs-next' of git://git.lwn.net/linux.git
config: arm-randconfig-002-20251106 (https://download.01.org/0day-ci/archive/20251106/202511061613.whODAEJk-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project d2625a438020ad35330cda29c3def102c1687b1b)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251106/202511061613.whODAEJk-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511061613.whODAEJk-lkp@intel.com/

All warnings (new ones prefixed by >>):

   Warning: arch/arm/mm/dma-mapping.c:1239 function parameter 'attrs' not described in 'arm_iommu_map_sg'
   Warning: arch/arm/mm/dma-mapping.c:1298 function parameter 'attrs' not described in 'arm_iommu_unmap_sg'
>> Warning: arch/arm/mm/dma-mapping.c:1405 expecting prototype for arm_iommu_unmap_page(). Prototype was for arm_iommu_unmap_phys() instead
   Warning: arch/arm/mm/dma-mapping.c:1239 function parameter 'attrs' not described in 'arm_iommu_map_sg'
   Warning: arch/arm/mm/dma-mapping.c:1298 function parameter 'attrs' not described in 'arm_iommu_unmap_sg'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
