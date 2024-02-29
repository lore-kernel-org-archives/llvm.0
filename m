Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2140F74BEE;
	Thu, 29 Feb 2024 22:16:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709244998; cv=none; b=p0ATRdehwmY0iLnDlGZ7EicQfW/jX0DqLhcF1qMhdQLPPXqs4Dx/BNIS7KLsC/kVz4nUEvbkEdPxMew+AaeN4+eMIL4n1Y6vcju9d4r0zxnr3dEBmscCly4GLEMQgePfNAIy9MzeTMzQA3zrUNxJu+AMOd/hj8LCSk1jHO9yHfs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709244998; c=relaxed/simple;
	bh=Pla/9yrincfM+TYMdF8+IIy7HvgifYqX/0u/MOEo0dM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=mPCjYvKraqz5VtFyJBvw5ph/UUTRqLME0dNncVE2fbQooUqFWsqlmYIQR/1k1LAKcRJ2mwrCm1hP9A3JZZmKzG+4+G0EHIRdJe6mtjaX3KPZhpyOnIhD+NUu1r+sVgXy7Iqe5klNlRqJnvTp4ONFd2LHlDvGWybfCfLwV03t4MM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=eIVs4lH/; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="eIVs4lH/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1709244998; x=1740780998;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Pla/9yrincfM+TYMdF8+IIy7HvgifYqX/0u/MOEo0dM=;
  b=eIVs4lH/3Hj1IJPull+Mta6hrGHgenFrzBDemANgAvU+nL4eo9nLlQcV
   cc62wWGdrCfg/D5yZrVoTqdftEIFgzF31h8VNQIF8GKCgeVbp418sKBJr
   A47LQm2L4/lEl4aWjqHjQZysqmI6ht6Qd97lB8OHzZqzBsBqi98Xtik6H
   dx6PZsMTN95P/W/1PlD9ziYsXHLsufIb5fHbvoTlcmZ/d/0TXM28lUO9N
   m6qMBwkjVpeyIzIPH5+EyvEUiRa18YLdfXhpNk1LxgrZTIx2EcQANF7dI
   HiA/APOlA2emeoOVEkUh4cm/B+azeDYnnOcbNIyJBo3Yb3ZAfkd7NHVKq
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10999"; a="7574693"
X-IronPort-AV: E=Sophos;i="6.06,194,1705392000"; 
   d="scan'208";a="7574693"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Feb 2024 14:16:37 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,194,1705392000"; 
   d="scan'208";a="7909044"
Received: from lkp-server02.sh.intel.com (HELO 3c78fa4d504c) ([10.239.97.151])
  by orviesa010.jf.intel.com with ESMTP; 29 Feb 2024 14:16:34 -0800
Received: from kbuild by 3c78fa4d504c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rfohc-000DJz-0U;
	Thu, 29 Feb 2024 22:16:32 +0000
Date: Fri, 1 Mar 2024 06:16:00 +0800
From: kernel test robot <lkp@intel.com>
To: Saurabh Sengar <saurabh.singh@xilinx.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev, git@amd.com,
	Michal Simek <monstr@monstr.eu>, Hyun Kwon <hyun.kwon@xilinx.com>
Subject: [xilinx-xlnx:xlnx_rebase_v6.6 243/860]
 drivers/gpu/drm/xlnx/xlnx_sdi.c:252:2: error: call to undeclared function
 'writel'; ISO C99 and later do not support implicit function declarations
Message-ID: <202403010652.EmZyLaSd-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/Xilinx/linux-xlnx xlnx_rebase_v6.6
head:   24eec56fe5bd68cae795c37c61276b4dcf218a53
commit: 6126d5c7f967fcef16227b5d83850832d0984135 [243/860] drm: xlnx: sdi: Adding sdi-tx driver
config: s390-allmodconfig (https://download.01.org/0day-ci/archive/20240301/202403010652.EmZyLaSd-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project edd4aee4dd9b5b98b2576a6f783e4086173d902a)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240301/202403010652.EmZyLaSd-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403010652.EmZyLaSd-lkp@intel.com/

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
   In file included from arch/s390/include/asm/elf.h:173:
   In file included from arch/s390/include/asm/mmu_context.h:11:
   In file included from arch/s390/include/asm/pgalloc.h:18:
   In file included from include/linux/mm.h:2168:
   include/linux/vmstat.h:508:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     508 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     509 |                            item];
         |                            ~~~~
   include/linux/vmstat.h:515:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     515 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     516 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:522:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     522 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   include/linux/vmstat.h:527:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     527 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     528 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:536:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     536 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     537 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
>> drivers/gpu/drm/xlnx/xlnx_sdi.c:252:2: error: call to undeclared function 'writel'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     252 |         writel(val, base + offset);
         |         ^
>> drivers/gpu/drm/xlnx/xlnx_sdi.c:257:9: error: call to undeclared function 'readl'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     257 |         return readl(base + offset);
         |                ^
   5 warnings and 2 errors generated.

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for DRM_PANEL_SIMPLE
   Depends on [n]: HAS_IOMEM [=y] && DRM [=m] && DRM_PANEL [=y] && OF [=y] && BACKLIGHT_CLASS_DEVICE [=m] && PM
   Selected by [m]:
   - DRM_XLNX_DSI [=m] && HAS_IOMEM [=y] && DRM_XLNX [=m]


vim +/writel +252 drivers/gpu/drm/xlnx/xlnx_sdi.c

   249	
   250	static inline void xlnx_sdi_writel(void __iomem *base, int offset, u32 val)
   251	{
 > 252		writel(val, base + offset);
   253	}
   254	
   255	static inline u32 xlnx_sdi_readl(void __iomem *base, int offset)
   256	{
 > 257		return readl(base + offset);
   258	}
   259	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
