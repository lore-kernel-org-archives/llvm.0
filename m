Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0AC632BAE7;
	Fri,  1 Mar 2024 03:08:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709262532; cv=none; b=i1qYkEFPZ44pVvyE81QaNGvPO0YbcbXKr0MrbKpqNqHc5fodZa0EsKyHD10IpmsCoHjJ3N+9eq9RCdNHmoD8ZmOvVwbzxjACEtNdgWVzNBklY2/MOP3BIBaYklKLTP0FFhbXKTrjFLv2PB8mS8eCjGU9jYXmINgMA8Jq7XTzl+E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709262532; c=relaxed/simple;
	bh=s3KJN8JDwITd9zuNN8xJ9dSj+TN3W+VNk4RCKrJTVkk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=XsYWcHXRhrgMGzJ2FE+PNcLMxAuPb9IsYQKITgnqaOCzShHeouxBBTpL89tU0euif5qGy1Y6GZtbS4GVmCwdSzq36gDITnixh5HBMrAXerX7Z4teAqTV8Aw0wrM934RlMo9o5sEDmF52eyn63vSuz8X39LZIZEuT+0vvrnlq2go=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=STR2iorN; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="STR2iorN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1709262526; x=1740798526;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=s3KJN8JDwITd9zuNN8xJ9dSj+TN3W+VNk4RCKrJTVkk=;
  b=STR2iorNybG6864uATFUpkPOsfzFUxE9RsRwvhL27ke4zdkeC98T+RJx
   VXJz+yi8pGS2+GoBlOPc4NjUjv2pjeYdI7+FlARw4R9kgJUt52dkMndks
   cStdW+g2BthTqEUIlBBnm+Ue/PvZ4Tf+3s6N34e/mQSK9LxJc1P0aczMd
   aF4qobk751hzjhOlDusOlQtu38mZwZqLYoIsBW05k0LzIKQNNmBByH1Oo
   4Kml6l5MY93bCGngXwVLLmWR7Yd+m9b/uoPgyMGQV/lPkX+dyB52s5RJ9
   /TmFYe4G4+2VrQ2/ui05Q6Q8VnDHelyidr1tNul0MxmUXog/Aqnssl35X
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10999"; a="3901349"
X-IronPort-AV: E=Sophos;i="6.06,194,1705392000"; 
   d="scan'208";a="3901349"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Feb 2024 19:08:45 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,194,1705392000"; 
   d="scan'208";a="8469006"
Received: from lkp-server02.sh.intel.com (HELO 3c78fa4d504c) ([10.239.97.151])
  by orviesa006.jf.intel.com with ESMTP; 29 Feb 2024 19:08:43 -0800
Received: from kbuild by 3c78fa4d504c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rftGL-000DUZ-1I;
	Fri, 01 Mar 2024 03:08:41 +0000
Date: Fri, 1 Mar 2024 11:08:26 +0800
From: kernel test robot <lkp@intel.com>
To: Michal Simek <monstr@monstr.eu>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev, git@amd.com,
	Jianqiang Chen <jianqiang.chen@xilinx.com>
Subject: [xilinx-xlnx:xlnx_rebase_v6.6 383/860]
 drivers/gpu/drm/xlnx/zynqmp_dp.c:361:2: error: call to undeclared function
 'writel'; ISO C99 and later do not support implicit function declarations
Message-ID: <202403011030.Z3zKPlIt-lkp@intel.com>
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
commit: bdf045814d4629c0ab369b168755b12635532dc3 [383/860] drm: xlnx: Update DP subsystem with downstream version
config: s390-allmodconfig (https://download.01.org/0day-ci/archive/20240301/202403011030.Z3zKPlIt-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project edd4aee4dd9b5b98b2576a6f783e4086173d902a)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240301/202403011030.Z3zKPlIt-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403011030.Z3zKPlIt-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/gpu/drm/xlnx/zynqmp_dp.c:12:
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
>> drivers/gpu/drm/xlnx/zynqmp_dp.c:361:2: error: call to undeclared function 'writel'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     361 |         writel(val, base + offset);
         |         ^
>> drivers/gpu/drm/xlnx/zynqmp_dp.c:366:9: error: call to undeclared function 'readl'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     366 |         return readl(base + offset);
         |                ^
   5 warnings and 2 errors generated.

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for DRM_PANEL_SIMPLE
   Depends on [n]: HAS_IOMEM [=y] && DRM [=m] && DRM_PANEL [=y] && OF [=y] && BACKLIGHT_CLASS_DEVICE [=m] && PM
   Selected by [m]:
   - DRM_XLNX_DSI [=m] && HAS_IOMEM [=y] && DRM_XLNX [=m]


vim +/writel +361 drivers/gpu/drm/xlnx/zynqmp_dp.c

   358	
   359	static void zynqmp_dp_write(void __iomem *base, int offset, u32 val)
   360	{
 > 361		writel(val, base + offset);
   362	}
   363	
   364	static u32 zynqmp_dp_read(void __iomem *base, int offset)
   365	{
 > 366		return readl(base + offset);
   367	}
   368	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
