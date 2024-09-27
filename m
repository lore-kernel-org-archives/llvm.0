Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD24C189502;
	Fri, 27 Sep 2024 13:11:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727442688; cv=none; b=H6jrSKIXO0t3auuk1jNz+Lc1EL0NMMRuv+si5sfHZnHzQ2p38TQ6/KPxL0T9KcMAxjx1Rm3jAWUeDVnUcjhtnIKz2ZvnLcUCRjeGTnFk9Y9u03kULNsg4t/3Q3dp4al+fzPsEus5y/5IojYTQdKjSxT6llc5/VLBxmSwW5Ksx/8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727442688; c=relaxed/simple;
	bh=c44bjS+p3rYDPqMG+zvAyh8nMa10/3qryBdZxj0A0cc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Rx6+TtNqh1N871qjaxAhBtOTWSya3kUnnDs7jofk0DdAxuWE8WkTw9Cv7D8n+YhTpZZk8KwLJ8RELQbyBGCCQA6TMZ4amGJoM8IAaw5DlV/YoNiR7kFmu0Bssz6mqUCvB2jfglqx4l50Nbz066GyhqFZOwD28MIokjuZL5BRCa4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=axlSue3F; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="axlSue3F"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1727442687; x=1758978687;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=c44bjS+p3rYDPqMG+zvAyh8nMa10/3qryBdZxj0A0cc=;
  b=axlSue3F0RgHjlu5xEZSQ4eQlGjM7SVvsTABCbQ0mKmr6JMNqAkQuwmi
   oS1ck9iS7GwaeAxnah1Upf/E14zt90mr7Yccx/70LzRxHxc0DJRWrxJCc
   7bFNOs4b6OcdNeymLyVtQ/xU+74ZDi/UnhKtjQ/kMD4RMo/crP06wNiiD
   szjmZ+LNOX+7PxfUvvOvrV1dsmcuH10u9acdbt2aW0RCtwYkyGtwea5JN
   1mw9ZzgHyHOrdS8Zp7XBdjD1VVpPcNKvAK9M91MAW+1DOqUWSzk4FVpOl
   ALHGko81Z4Rt4TfgIMXtKK18Bb7AERBuI63W6ENQ1NW1r+30JV4mSDztP
   A==;
X-CSE-ConnectionGUID: mqX8v0o2S9ySHwwInBe6MA==
X-CSE-MsgGUID: kjX+plnaSpW085dr7d2J/A==
X-IronPort-AV: E=McAfee;i="6700,10204,11207"; a="14204605"
X-IronPort-AV: E=Sophos;i="6.11,158,1725346800"; 
   d="scan'208";a="14204605"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Sep 2024 06:11:25 -0700
X-CSE-ConnectionGUID: XTVnf3WCQVeArxrh+RJNsA==
X-CSE-MsgGUID: PKnhSLveQ7CMRlF01UJ5Wg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,158,1725346800"; 
   d="scan'208";a="72837928"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 27 Sep 2024 06:11:24 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1suAkj-000MAF-0B;
	Fri, 27 Sep 2024 13:11:21 +0000
Date: Fri, 27 Sep 2024 21:10:34 +0800
From: kernel test robot <lkp@intel.com>
To: Michal Simek <monstr@monstr.eu>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev, git@amd.com,
	Jianqiang Chen <jianqiang.chen@xilinx.com>
Subject: [xilinx-xlnx:xlnx_rebase_v6.6_LTS_2024.1_update 383/1001]
 drivers/gpu/drm/xlnx/zynqmp_dp.c:361:2: error: call to undeclared function
 'writel'; ISO C99 and later do not support implicit function declarations
Message-ID: <202409272111.QHpMu8rt-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Michal,

FYI, the error/warning still remains.

tree:   https://github.com/Xilinx/linux-xlnx xlnx_rebase_v6.6_LTS_2024.1_update
head:   5365c13a86998da06d845c918f849b30b8735538
commit: bdf045814d4629c0ab369b168755b12635532dc3 [383/1001] drm: xlnx: Update DP subsystem with downstream version
config: s390-allmodconfig (https://download.01.org/0day-ci/archive/20240927/202409272111.QHpMu8rt-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project 7773243d9916f98ba0ffce0c3a960e4aa9f03e81)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240927/202409272111.QHpMu8rt-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409272111.QHpMu8rt-lkp@intel.com/

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
