Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 775F6158DA9;
	Tue,  9 Apr 2024 23:03:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712703798; cv=none; b=cS8J3L0BWj7y1lddQN6Wa+sBmWju+D0k86GbMVWAppkYUd0bsJuaNX0aV9X6i5JF7hi8IKBJ11EjxQ7iOSQzYAsR9Re10bLukIes+ZPl+rNjk66RKCrjFPi1nm1jaugg5UkTusNXU+csZ9B50Tt82UlIGzb0AgQ0me9xv2IiYwY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712703798; c=relaxed/simple;
	bh=cYSniIIcXNpvUdUi/MOJREUtALOtW40qiCr7QibBTUU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=AAukogfgGSexHJwUpIPKL2GGpG3X5Wu1ZU1HVGQNfmg36BzuIi8qNfsxePUUOVwgQjdRIktmEBOPy4PQn2YRwIuyuiLo9djYXP63zyxOGSQFeHUJbQcqGBgrgaDeRnXY7qoU85Dxf++tOlEfWeD5w5y6RqKaQ4DIFSkvQSH1SAg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TDQ1vu1L; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TDQ1vu1L"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1712703797; x=1744239797;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=cYSniIIcXNpvUdUi/MOJREUtALOtW40qiCr7QibBTUU=;
  b=TDQ1vu1LWce8JCxjV7tMhbWRU3g2sYiyQJ8wbbvaSqEhNLrWNq+Wc8gw
   JOMWXtViSk3Hcll3vZxc3ZsKBBw/fC03ACERnWYLEzGKmCQr4YHjTgRiv
   ndW8KrtuU1Qb0PVeXrMMkDAjJAZMduY3x2bubro6IsGlFKS1KSWKmL/+G
   +1w9ZJziMosmXwSLsdoIIIqkleSQFs2X7VTu2GSjh57KzkFw2Y41PJZkT
   r7NsduEM7qRJYs3VbB0TNXxTRjWwCEYgLpeEFlsQAe+aESVdV8L6EjC0o
   JgtdwK/zJAJ8Ej6Sa19VkTJCj8/E/x5mEUvBdCD+LZ9r2E6rhsoOmxzHD
   w==;
X-CSE-ConnectionGUID: 7ooXzs5nTaC2/lJiuajbZQ==
X-CSE-MsgGUID: vUIsVSxJRM2L8DYCJqGZPw==
X-IronPort-AV: E=McAfee;i="6600,9927,11039"; a="7899630"
X-IronPort-AV: E=Sophos;i="6.07,190,1708416000"; 
   d="scan'208";a="7899630"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Apr 2024 16:03:11 -0700
X-CSE-ConnectionGUID: /sM+yw3lRXCcBRzNKiB86A==
X-CSE-MsgGUID: 3F+xk7TARuG0k2ljl/5mCQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,190,1708416000"; 
   d="scan'208";a="20247315"
Received: from lkp-server01.sh.intel.com (HELO e61807b1d151) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 09 Apr 2024 16:03:10 -0700
Received: from kbuild by e61807b1d151 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ruKUc-0006bC-2u;
	Tue, 09 Apr 2024 23:03:06 +0000
Date: Wed, 10 Apr 2024 07:03:03 +0800
From: kernel test robot <lkp@intel.com>
To: Russell King <rmk+kernel@armlinux.org.uk>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [arm:csi-v6 3/7] drivers/staging/media/imx/imx6-mipi-csi2.c:649:3:
 error: field designator 'g_frame_interval' does not refer to any field in
 type 'const struct v4l2_subdev_video_ops'
Message-ID: <202404100600.4aP0e3JD-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://git.armlinux.org.uk/~rmk/linux-arm.git csi-v6
head:   75b60600898d54fe4d989e31b9aa6a1b03b6576a
commit: eefc9055c55fe918f5365a9ac7cab6e808edbe7f [3/7] media: staging/imx: add frame intervals back in
config: riscv-allyesconfig (https://download.01.org/0day-ci/archive/20240410/202404100600.4aP0e3JD-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project 546dc2245ffc4cccd0b05b58b7a5955e355a3b27)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240410/202404100600.4aP0e3JD-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404100600.4aP0e3JD-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/staging/media/imx/imx6-mipi-csi2.c:8:
   In file included from include/linux/interrupt.h:21:
   In file included from arch/riscv/include/asm/sections.h:9:
   In file included from include/linux/mm.h:2188:
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
>> drivers/staging/media/imx/imx6-mipi-csi2.c:649:3: error: field designator 'g_frame_interval' does not refer to any field in type 'const struct v4l2_subdev_video_ops'
     649 |         .g_frame_interval = csi2_g_frame_interval,
         |         ~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/staging/media/imx/imx6-mipi-csi2.c:650:3: error: field designator 's_frame_interval' does not refer to any field in type 'const struct v4l2_subdev_video_ops'
     650 |         .s_frame_interval = csi2_s_frame_interval,
         |         ~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   5 warnings and 2 errors generated.
--
   In file included from drivers/media/platform/video-mux.c:18:
   In file included from include/media/v4l2-device.h:12:
   In file included from include/media/media-device.h:16:
   In file included from include/linux/pci.h:38:
   In file included from include/linux/interrupt.h:21:
   In file included from arch/riscv/include/asm/sections.h:9:
   In file included from include/linux/mm.h:2188:
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
>> drivers/media/platform/video-mux.c:172:3: error: field designator 'g_frame_interval' does not refer to any field in type 'const struct v4l2_subdev_video_ops'
     172 |         .g_frame_interval = vidsw_g_frame_interval,
         |         ~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/media/platform/video-mux.c:173:3: error: field designator 's_frame_interval' does not refer to any field in type 'const struct v4l2_subdev_video_ops'
     173 |         .s_frame_interval = vidsw_s_frame_interval,
         |         ~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   5 warnings and 2 errors generated.


vim +649 drivers/staging/media/imx/imx6-mipi-csi2.c

   646	
   647	static const struct v4l2_subdev_video_ops csi2_video_ops = {
   648		.s_stream = csi2_s_stream,
 > 649		.g_frame_interval = csi2_g_frame_interval,
 > 650		.s_frame_interval = csi2_s_frame_interval,
   651	};
   652	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
