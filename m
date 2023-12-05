Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E44A26FCE1;
	Tue,  5 Dec 2023 23:15:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JgfxOGsS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701818101; x=1733354101;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=uvO2Khwda7EpRuiNDYxdXOiNlOv9MVw2vm74fm8w2zM=;
  b=JgfxOGsScVF4kJ7POKShZ8/GRM8jI9AdZaT31IQtDuEIGz/5PNNpeq0Q
   U6oEpebpIMnQhJsGJdI+iXEY7ePBcCjk3LL/IHbpAwm9SSslXAUXysm7e
   KB4C9dydILIQ9oNpJb+JOmo0WyvPlitnVVU3U4Lx39JmjD0H6qXCQW4oA
   LwaAsqTLdFXVk5ejhggCHSX1kEtHAO87ZPBAF9AP+rftHBeJOmtjmwaFm
   NBPss6nG2RFHV2YsqsLSfHlTNjnFNAbOauUFrs3ki8E4ESR3bKGsP1k9m
   USQAYlKKSk0A9s0OUDHDIUZaekcJ+F3+hHADqm7AZmQwNUnGWrKww5tZW
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10915"; a="397863259"
X-IronPort-AV: E=Sophos;i="6.04,253,1695711600"; 
   d="scan'208";a="397863259"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Dec 2023 15:15:01 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10915"; a="944435995"
X-IronPort-AV: E=Sophos;i="6.04,253,1695711600"; 
   d="scan'208";a="944435995"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by orsmga005.jf.intel.com with ESMTP; 05 Dec 2023 15:14:58 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rAecy-0009rM-0l;
	Tue, 05 Dec 2023 23:14:56 +0000
Date: Wed, 6 Dec 2023 07:14:05 +0800
From: kernel test robot <lkp@intel.com>
To: Shin'ichiro Kawasaki <shinichiro.kawasaki@wdc.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH RFC] platform/x86: p2sb: Allow p2sb_bar() calls during
 PCI device probe
Message-ID: <202312060601.Wtrr6tJ1-lkp@intel.com>
References: <20231201104759.949340-1-shinichiro.kawasaki@wdc.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231201104759.949340-1-shinichiro.kawasaki@wdc.com>

Hi Shin'ichiro,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build warnings:

[auto build test WARNING on linus/master]
[also build test WARNING on v6.7-rc4 next-20231205]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Shin-ichiro-Kawasaki/platform-x86-p2sb-Allow-p2sb_bar-calls-during-PCI-device-probe/20231201-185053
base:   linus/master
patch link:    https://lore.kernel.org/r/20231201104759.949340-1-shinichiro.kawasaki%40wdc.com
patch subject: [PATCH RFC] platform/x86: p2sb: Allow p2sb_bar() calls during PCI device probe
config: i386-randconfig-011-20231203 (https://download.01.org/0day-ci/archive/20231206/202312060601.Wtrr6tJ1-lkp@intel.com/config)
compiler: clang version 16.0.4 (https://github.com/llvm/llvm-project.git ae42196bc493ffe877a7e3dff8be32035dea4d07)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231206/202312060601.Wtrr6tJ1-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202312060601.Wtrr6tJ1-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/platform/x86/p2sb.c:90:9: warning: variable 'ret' is uninitialized when used here [-Wuninitialized]
           return ret;
                  ^~~
   drivers/platform/x86/p2sb.c:79:9: note: initialize the variable 'ret' to silence this warning
           int ret;
                  ^
                   = 0
   1 warning generated.

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for DRM_I915_DEBUG_GEM
   Depends on [n]: HAS_IOMEM [=y] && DRM_I915 [=m] && EXPERT [=y] && DRM_I915_WERROR [=n]
   Selected by [m]:
   - DRM_I915_DEBUG [=y] && HAS_IOMEM [=y] && DRM_I915 [=m] && EXPERT [=y] && !COMPILE_TEST [=n]


vim +/ret +90 drivers/platform/x86/p2sb.c

9745fb07474f450 drivers/platform/x86/intel/p2sb.c Jonathan Yong        2022-06-06  75  
d34534bd969a42a drivers/platform/x86/p2sb.c       Shin'ichiro Kawasaki 2023-12-01  76  static int p2sb_scan_and_cache(struct pci_bus *bus, unsigned int devfn)
9745fb07474f450 drivers/platform/x86/intel/p2sb.c Jonathan Yong        2022-06-06  77  {
9745fb07474f450 drivers/platform/x86/intel/p2sb.c Jonathan Yong        2022-06-06  78  	struct pci_dev *pdev;
9745fb07474f450 drivers/platform/x86/intel/p2sb.c Jonathan Yong        2022-06-06  79  	int ret;
d34534bd969a42a drivers/platform/x86/p2sb.c       Shin'ichiro Kawasaki 2023-12-01  80  	struct p2sb_res_cache *cache = &p2sb_resources[PCI_FUNC(devfn)];
9745fb07474f450 drivers/platform/x86/intel/p2sb.c Jonathan Yong        2022-06-06  81  
9745fb07474f450 drivers/platform/x86/intel/p2sb.c Jonathan Yong        2022-06-06  82  	pdev = pci_scan_single_device(bus, devfn);
d34534bd969a42a drivers/platform/x86/p2sb.c       Shin'ichiro Kawasaki 2023-12-01  83  	if (!pdev || p2sb_invalid_resource(&pdev->resource[0]))
9745fb07474f450 drivers/platform/x86/intel/p2sb.c Jonathan Yong        2022-06-06  84  		return -ENODEV;
9745fb07474f450 drivers/platform/x86/intel/p2sb.c Jonathan Yong        2022-06-06  85  
d34534bd969a42a drivers/platform/x86/p2sb.c       Shin'ichiro Kawasaki 2023-12-01  86  	p2sb_read_bar0(pdev, &cache->res);
d34534bd969a42a drivers/platform/x86/p2sb.c       Shin'ichiro Kawasaki 2023-12-01  87  	cache->bus_dev_id = bus->dev.id;
9745fb07474f450 drivers/platform/x86/intel/p2sb.c Jonathan Yong        2022-06-06  88  
9745fb07474f450 drivers/platform/x86/intel/p2sb.c Jonathan Yong        2022-06-06  89  	pci_stop_and_remove_bus_device(pdev);
9745fb07474f450 drivers/platform/x86/intel/p2sb.c Jonathan Yong        2022-06-06 @90  	return ret;
9745fb07474f450 drivers/platform/x86/intel/p2sb.c Jonathan Yong        2022-06-06  91  }
9745fb07474f450 drivers/platform/x86/intel/p2sb.c Jonathan Yong        2022-06-06  92  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
