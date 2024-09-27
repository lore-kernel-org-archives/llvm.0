Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA11017ADF0;
	Fri, 27 Sep 2024 11:46:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727437577; cv=none; b=N+olpdsOoxZByg5v8BomGvRsmuOwvvm4nVD8jB2lfMsY1phHq+a7+xOi4DUayWwiz9irgUNrtitj0/XmMJ1SXX/vHJRmFesY83NVolVLcML2JUQ9t6ZBN8rbPyS+YuuUqFR8STwO+6Q5wW+k8NGqmWqP4YW58UDRleD+KTIkvVI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727437577; c=relaxed/simple;
	bh=Ya+LQ5q5MK6pIM01FgrfAcpRmyHo07YjIdpTdnh+4gI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=XJE8VkafSd5VhGH6yWCLLNx2fCQrp2Y1DeaBN2sw2a3VuS8O3LSPsYZL0FbB2SQJ41SzK7t4AOBoKJKgeDtd1KNriz3RdfJii4dikRndwObsoX+RkG9gV0Ay8SLjsNcde1Cd80lYfb32a1YevfhPrzu1vcZvzHjDRZvRwKhWvg4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=J5XhgMib; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="J5XhgMib"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1727437576; x=1758973576;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Ya+LQ5q5MK6pIM01FgrfAcpRmyHo07YjIdpTdnh+4gI=;
  b=J5XhgMiba+SCjNq5C1X2LD3EZwUT9KpknLMic54z/u/CmXA88L/9YHn5
   zQI2pVydojEA8dssFj0ZDVXiecgop6Nr0CyOy3Hik2NyFQYIvISM1E8zl
   zOYNY9HhkytPYF4988HlmSGEf48urvJr9BJ4COJhonhLUJ1B950P59rcv
   jiCZGfa7FTezk7XpcMcxM9l1s1fG2V5ZomdXFkikBxAMCtBiw3f7Fo19v
   UV1xhBuR3ZNUrD0zxbFP/5JVw9BPGTGZ6oY++vB+W3hSTZ+4yvRFtBqu7
   pu5SRJX9elwOcxrUjQ9UH8YvrR3NH9bzK6ZHY/f2SOVSbCNZF9/tnpCzr
   A==;
X-CSE-ConnectionGUID: 1/7l1N3oS0OXA9q7RiDoyA==
X-CSE-MsgGUID: nKGTFFfzQrOafifczCHRNg==
X-IronPort-AV: E=McAfee;i="6700,10204,11207"; a="26525044"
X-IronPort-AV: E=Sophos;i="6.11,158,1725346800"; 
   d="scan'208";a="26525044"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Sep 2024 04:46:15 -0700
X-CSE-ConnectionGUID: /ERdoAa+QHyqnkilVLyZCw==
X-CSE-MsgGUID: szyOh+DSTqCzOoCxCO66DA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,158,1725346800"; 
   d="scan'208";a="95846291"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 27 Sep 2024 04:46:13 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1su9QJ-000Lrf-1G;
	Fri, 27 Sep 2024 11:46:11 +0000
Date: Fri, 27 Sep 2024 19:45:52 +0800
From: kernel test robot <lkp@intel.com>
To: Saurabh Sengar <saurabh.singh@xilinx.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev, git@amd.com,
	Michal Simek <monstr@monstr.eu>, Hyun Kwon <hyun.kwon@xilinx.com>
Subject: [xilinx-xlnx:xlnx_rebase_v6.6_LTS_2024.1_update 243/1001]
 drivers/gpu/drm/xlnx/xlnx_sdi.c:252:2: error: call to undeclared function
 'writel'; ISO C99 and later do not support implicit function declarations
Message-ID: <202409271949.tKXOv6M6-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Saurabh,

FYI, the error/warning still remains.

tree:   https://github.com/Xilinx/linux-xlnx xlnx_rebase_v6.6_LTS_2024.1_update
head:   5365c13a86998da06d845c918f849b30b8735538
commit: 6126d5c7f967fcef16227b5d83850832d0984135 [243/1001] drm: xlnx: sdi: Adding sdi-tx driver
config: s390-allmodconfig (https://download.01.org/0day-ci/archive/20240927/202409271949.tKXOv6M6-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project 7773243d9916f98ba0ffce0c3a960e4aa9f03e81)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240927/202409271949.tKXOv6M6-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409271949.tKXOv6M6-lkp@intel.com/

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
