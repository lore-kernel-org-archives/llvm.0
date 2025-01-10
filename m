Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97E46ECC;
	Fri, 10 Jan 2025 20:31:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736541067; cv=none; b=NQeE15p5QRPpMwVSCD9X8KQzwRTU4GMCQv6RbH3637DT3Lz5C0E8Y4zEcwV04vC5lVaE6/FrF6SDv9mI16dC+LcfRkP6gkMDoI2AmVCSbZ175R4hI03A33VFLLdAxuDACphhmDKytyuqCbrSzV81di2yJrsLSBdi2efUiR8pPR0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736541067; c=relaxed/simple;
	bh=YwLYF5sy5ZJMxhF8fodIWyUGbggAFXUtv/SxjAAJ/4I=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=UegrsSVTsuPtrT3XBQzplT81xCPxD7BXlMS0BfrH9MzNw74V/TS2h9RqH4I7L9GLd90kis3J27iXFZsDZ/vLRMxzMZgONVqHM5kghhSuHt9XlaDjQj2PE+S+S1C1+JSr09GMDCfDkfQUUis7FC2ZE0lYM1X/bcDm+Rf9guHTLs8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=b2nOj8s6; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="b2nOj8s6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1736541065; x=1768077065;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=YwLYF5sy5ZJMxhF8fodIWyUGbggAFXUtv/SxjAAJ/4I=;
  b=b2nOj8s6v4fut/iKRzGAUL86ovM/bFOcQJ4Ftvm6nBqPYuUOkWhB6Va3
   6q14y68aZayNmz9Tiv78bvwBkaCLz1cfv+NvLfuqHnCG5jUI6wGb3mP/i
   i+GfW8mH22ac3XqMC+Kopiz/eglrRrOwnFjHn3/G/4XoMXdqoBG0a9vJY
   /bs0OGCKE9kRMjTna9yYYrBd6rs1WpatT48HaXf2tdNfYQ0NjVXaAsoZQ
   gk6bsDzvDzxpGCOVfJbmrD7rSgNx54OuNvFX2cKkSWV4FqJULCMeQzbB6
   +hJ39Zs/uUSylC5eCEfRVvqFljGhZYZKVEamQ5p+0tFS78d8gHtKVpTM/
   A==;
X-CSE-ConnectionGUID: 0AdaUkAdTSCileo1ft6wtA==
X-CSE-MsgGUID: 5Lc1ZBESRg2/Qp9U/wSvuQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11311"; a="40529462"
X-IronPort-AV: E=Sophos;i="6.12,305,1728975600"; 
   d="scan'208";a="40529462"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jan 2025 12:31:04 -0800
X-CSE-ConnectionGUID: LxcTPbSrTIetyBfpW+wTnQ==
X-CSE-MsgGUID: VtTOrqyfTzS8VTasHSSO1g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="108457884"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 10 Jan 2025 12:31:02 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tWLel-000Jix-1u;
	Fri, 10 Jan 2025 20:30:59 +0000
Date: Sat, 11 Jan 2025 04:30:35 +0800
From: kernel test robot <lkp@intel.com>
To: Saurabh Sengar <saurabh.singh@xilinx.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev, git@amd.com,
	Michal Simek <monstr@monstr.eu>, Hyun Kwon <hyun.kwon@xilinx.com>
Subject: [xilinx-xlnx:lkp_test 199/504]
 drivers/gpu/drm/xlnx/xlnx_sdi.c:264:2: error: call to undeclared function
 'writel'; ISO C99 and later do not support implicit function declarations
Message-ID: <202501110456.Rp1A9JK0-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/Xilinx/linux-xlnx lkp_test
head:   9ac6b4acf9144465ac1408d4d799635dec0223a0
commit: fd4e677cfcfc2c6455abc12955015afd8c3790e6 [199/504] drm: xlnx: sdi: Adding sdi-tx driver
config: s390-allmodconfig (https://download.01.org/0day-ci/archive/20250111/202501110456.Rp1A9JK0-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250111/202501110456.Rp1A9JK0-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501110456.Rp1A9JK0-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/gpu/drm/xlnx/xlnx_sdi.c:10:
   In file included from include/drm/drm_atomic_helper.h:31:
   In file included from include/drm/drm_crtc.h:32:
   In file included from include/drm/drm_modes.h:30:
   In file included from include/linux/hdmi.h:28:
   In file included from include/linux/device.h:32:
   In file included from include/linux/device/driver.h:21:
   In file included from include/linux/module.h:19:
   In file included from include/linux/elf.h:6:
   In file included from arch/s390/include/asm/elf.h:181:
   In file included from arch/s390/include/asm/mmu_context.h:11:
   In file included from arch/s390/include/asm/pgalloc.h:18:
   In file included from include/linux/mm.h:2213:
   include/linux/vmstat.h:504:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     504 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     505 |                            item];
         |                            ~~~~
   include/linux/vmstat.h:511:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     511 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     512 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:518:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     518 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   include/linux/vmstat.h:524:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     524 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     525 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
>> drivers/gpu/drm/xlnx/xlnx_sdi.c:264:2: error: call to undeclared function 'writel'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     264 |         writel(val, base + offset);
         |         ^
>> drivers/gpu/drm/xlnx/xlnx_sdi.c:269:9: error: call to undeclared function 'readl'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     269 |         return readl(base + offset);
         |                ^
   4 warnings and 2 errors generated.


vim +/writel +264 drivers/gpu/drm/xlnx/xlnx_sdi.c

   261	
   262	static inline void xlnx_sdi_writel(void __iomem *base, int offset, u32 val)
   263	{
 > 264		writel(val, base + offset);
   265	}
   266	
   267	static inline u32 xlnx_sdi_readl(void __iomem *base, int offset)
   268	{
 > 269		return readl(base + offset);
   270	}
   271	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
