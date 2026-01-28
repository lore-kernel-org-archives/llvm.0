Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B917C29A1;
	Wed, 28 Jan 2026 08:35:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769589329; cv=none; b=tKNauUv3CbwryyOwrlSEJYGGrf6gwTFnSwmhwTkc2gMWjbz6J46Vc7jXeIQGrhCdqS9snzDxRmhvjfOIOy9JUT/z88mqO6il7lYncT4So1spn8aHc+89CywZ4YcKcpMBc1zvV9nYWT5iZDNEFinallxnip2xdzpoBqHdF0Jt3aI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769589329; c=relaxed/simple;
	bh=YoKL3w8ZLoRqQ1yvu+jtmAE/zokmXnq8i67e74f7bD8=;
	h=Date:From:To:Cc:Subject:Message-ID; b=D1YvcXOey/LGL95BZF7cIYvemXmixVjBXevi+xn11p5MrTHfu3O36wIMYr4rMc2NCoWKg18XRvU13X4LuB8IN7DF2EV6kodMJ45Tsjk81RrR3vsN1qdXEMyCSxsZwu2HyqrAkmIg3on9DrSbePkBkbpbA2Rcemrz4zY4EdWRISs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ftrGNsLx; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ftrGNsLx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769589327; x=1801125327;
  h=date:from:to:cc:subject:message-id;
  bh=YoKL3w8ZLoRqQ1yvu+jtmAE/zokmXnq8i67e74f7bD8=;
  b=ftrGNsLxy7qqGX4apsHestDDh2e2UB2hpKJ0NYh7HZ0sYKZVY24pSlYv
   VZDrEnydlcLfVDrX9Z5+JJHy0ey7SOtOSmwDLMOtYWrR4yRmqPc44M7GT
   17jli/Py0c5op11/ajFAlRHZ4T2V4FdHuivQ/nVy/YyWpo5szRF4cIHx6
   5NrL23Htpn1d2eXCuFJQc5P0EGxhlE3dYE2rDFuwO4zLJerF0w5uW4Mam
   3zu1fVeAqLBUdeV8QpcbV6m/pvEDVVvUO949GWuTARuo+fmEhO5twrbfP
   1nw9dm7KnZpjyoQv0GwKfFco7fHjFoB4yJd0DKs6t9iX4F5Xko6Dbn9ck
   Q==;
X-CSE-ConnectionGUID: QU0rwbxdTWa+/VgALU5hUg==
X-CSE-MsgGUID: VqKk8Or1SlKM3q8pALfsUA==
X-IronPort-AV: E=McAfee;i="6800,10657,11684"; a="82163034"
X-IronPort-AV: E=Sophos;i="6.21,258,1763452800"; 
   d="scan'208";a="82163034"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jan 2026 00:35:27 -0800
X-CSE-ConnectionGUID: aW4FzNuFSNmHQJx7KvswvQ==
X-CSE-MsgGUID: j/qyVG45T5KdjA2mxFy1Vg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,258,1763452800"; 
   d="scan'208";a="208275225"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 28 Jan 2026 00:35:25 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vl11G-00000000ZTA-1xXl;
	Wed, 28 Jan 2026 08:35:22 +0000
Date: Wed, 28 Jan 2026 16:35:21 +0800
From: kernel test robot <lkp@intel.com>
To: Richard Kuo <rkuo@quicinc.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 Brian Cain <bcain@kernel.org>
Subject: [bcain:bcain/boot_qemu 20/38]
 drivers/memory/pl353-smc.c:62:34: warning: unused variable
 'pl353_smc_supported_children'
Message-ID: <202601281649.gu6jAJq8-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

Hi Richard,

First bad commit (maybe != root cause):

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/bcain/linux.git bcain/boot_qemu
head:   6dd00eeb9163d38cdab8b12c40702a711f04a9ab
commit: 78951630122eae2f9915fda71077ecd729f34ff0 [20/38] hexagon: update build system and Kconfig
config: hexagon-randconfig-002-20260128 (https://download.01.org/0day-ci/archive/20260128/202601281649.gu6jAJq8-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260128/202601281649.gu6jAJq8-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601281649.gu6jAJq8-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/memory/pl353-smc.c:62:34: warning: unused variable 'pl353_smc_supported_children' [-Wunused-const-variable]
      62 | static const struct of_device_id pl353_smc_supported_children[] = {
         |                                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   1 warning generated.


vim +/pl353_smc_supported_children +62 drivers/memory/pl353-smc.c

fee10bd2267868 Naga Sureshkumar Relli 2018-12-06  58  
fee10bd2267868 Naga Sureshkumar Relli 2018-12-06  59  static SIMPLE_DEV_PM_OPS(pl353_smc_dev_pm_ops, pl353_smc_suspend,
fee10bd2267868 Naga Sureshkumar Relli 2018-12-06  60  			 pl353_smc_resume);
fee10bd2267868 Naga Sureshkumar Relli 2018-12-06  61  
fee10bd2267868 Naga Sureshkumar Relli 2018-12-06 @62  static const struct of_device_id pl353_smc_supported_children[] = {
fee10bd2267868 Naga Sureshkumar Relli 2018-12-06  63  	{
fee10bd2267868 Naga Sureshkumar Relli 2018-12-06  64  		.compatible = "cfi-flash"
fee10bd2267868 Naga Sureshkumar Relli 2018-12-06  65  	},
fee10bd2267868 Naga Sureshkumar Relli 2018-12-06  66  	{
fee10bd2267868 Naga Sureshkumar Relli 2018-12-06  67  		.compatible = "arm,pl353-nand-r2p1",
fee10bd2267868 Naga Sureshkumar Relli 2018-12-06  68  	},
fee10bd2267868 Naga Sureshkumar Relli 2018-12-06  69  	{}
fee10bd2267868 Naga Sureshkumar Relli 2018-12-06  70  };
fee10bd2267868 Naga Sureshkumar Relli 2018-12-06  71  

:::::: The code at line 62 was first introduced by commit
:::::: fee10bd2267868f2a3e7ba008ef7665aac5e4412 memory: pl353: Add driver for arm pl353 static memory controller

:::::: TO: Naga Sureshkumar Relli <naga.sureshkumar.relli@xilinx.com>
:::::: CC: Michal Simek <michal.simek@xilinx.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
