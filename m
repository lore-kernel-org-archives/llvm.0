Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F5F61F790F;
	Sun, 28 Sep 2025 14:05:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759068305; cv=none; b=Bbdo2EEeLVpqw6aOSKaRpWgoqbH3ZiddHahWw1dDOrnUEWpR7ErgtDSeb1R+3Ihk/kuOtH1SVcZxY8gIhine1jVlhEjmEQlo1sZRnpEUXSThlV4pcGnkl/UMb4dV1z262tEULF0wqmrZnkdLLATCZw4EzC+c4EiRrZpiZ8w/KFs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759068305; c=relaxed/simple;
	bh=1M5OS7GUWwRD4CXr9HXBE3LDwxfHJJAZgQggkuRYtoc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=e76Bq6IkDrXLWVhDT1ycopGlrvmAxkiZublilV+F7Cn5uXT012RzbXZ17cXJVflfFB2VCB4CZf4P2IezVEaI/REGj8JdAhE6KA7MNZmRBMpdPb6kDXkwBR6DYjzS7KyoAtxJBsMgrfBXfy+G4pTazJ3OrGw7jgnpO3QR0PPVGc8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HfyZChaT; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HfyZChaT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1759068304; x=1790604304;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=1M5OS7GUWwRD4CXr9HXBE3LDwxfHJJAZgQggkuRYtoc=;
  b=HfyZChaTvOwEdUoYJ/dMkpWrjfjfOG1W9CY9qliCJ1Z4rrCU3MDuRbaK
   Ukda35Uv5ZFIBq4uQDhtUEHAOULodlIhGIkFhT2aCE3c9+Fjv+7nmuctR
   MgzrD0AKWpGR2oCc42b1wePeK3BjBMOfjHrXqCRzoXtPf1g+RXWveFoy5
   pSceS4h4MxnP4q1+jH3lw1A8Pf+4nLxeUyj4BS+8tPv+UWC2cC/C7MO58
   kzwiXvI1v+fOwpExloHx2/JuHCIgUXEGdr+ge2oC3jmMIR/OoJQ+LTwpO
   IPG6E6EzWyeth4FuBIPl13NzFq0lbTO+XX/X1w7xPw7vWV7MQollLeBag
   g==;
X-CSE-ConnectionGUID: oSaunKN4QZWjcjmUsUlN+w==
X-CSE-MsgGUID: Zme/GdqYRZusl9A7KsIG/Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="61378000"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="61378000"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Sep 2025 07:05:03 -0700
X-CSE-ConnectionGUID: pvHvFEAmTqaxx3CWyUFdFg==
X-CSE-MsgGUID: 8rvT3eIuStWb8+W+2SG25Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,299,1751266800"; 
   d="scan'208";a="182429047"
Received: from lkp-server02.sh.intel.com (HELO 84c55410ccf6) ([10.239.97.151])
  by fmviesa005.fm.intel.com with ESMTP; 28 Sep 2025 07:05:01 -0700
Received: from kbuild by 84c55410ccf6 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1v2s1L-0007qD-1Q;
	Sun, 28 Sep 2025 14:04:59 +0000
Date: Sun, 28 Sep 2025 22:04:13 +0800
From: kernel test robot <lkp@intel.com>
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [jgunthorpe:iommu_pt_all 38/56] ERROR: modpost:
 "iommu_pages_free_incoherent" [drivers/iommu/generic_pt/fmt/iommu_armv7s.ko]
 undefined!
Message-ID: <202509290031.sRv1W6Vg-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/jgunthorpe/linux iommu_pt_all
head:   522863b6a09fe03ab056bfb3d451f0acca859902
commit: 98302a011be816bafc6adfb3db80494b7619b515 [38/56] iommupt: Add the 32 bit ARMv7s page table format
config: hexagon-allmodconfig (https://download.01.org/0day-ci/archive/20250929/202509290031.sRv1W6Vg-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250929/202509290031.sRv1W6Vg-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202509290031.sRv1W6Vg-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

>> ERROR: modpost: "iommu_pages_free_incoherent" [drivers/iommu/generic_pt/fmt/iommu_armv7s.ko] undefined!

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
