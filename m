Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 077C91BBBEA;
	Tue, 21 Jan 2025 11:26:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737458775; cv=none; b=VX6SFEhA0rgf5IyVGaXNHkMtaUUIbch3RmKozAdS5reKKZMOfE5am1FBYrv+tMWC+RQoTODEIw7apW46yFMWvHCu1im2YgLNnqOt1gt6xKZ+rX+8N5Fk4qRxXyaAPiYFfpZA93+SFLBNnkqRzUqhx13JlVTL0A9PrU/yQzrlpm4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737458775; c=relaxed/simple;
	bh=hWb4Ht0bzndW2oxQvVevDtAzfUN9v2ft2X/GsOI4QC4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=JdI1rwdjbvoGCpbS39ecSEOxC3ydE8OhFeKf3GQCVduCU+2rbCPYnWS5tmK92rc64O0s3oaGooX55UqCfemIdGxr8UovqYYwUtMyOprjIwnBK1ag8RHvmVzwLs07OI0RKRNX43vAHYPuVpQLYfSA3IR10P0rDEGKnDkICqiK4j0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FvoI30NQ; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FvoI30NQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1737458773; x=1768994773;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=hWb4Ht0bzndW2oxQvVevDtAzfUN9v2ft2X/GsOI4QC4=;
  b=FvoI30NQS+Kl8KgvEgxKRZwEttBYHBGs9hiWmHeIu00xtzay8q+wU3uq
   Kf589nQPco29zYhAxYVW3FVEE9zBMWykqJOjwKENMFvrkcnumdtJw9i/C
   ZJzMuZoobsqHf1wWZJZDhZlc1vOm0aZlj8xE7NIT1W+lQ1J81Bsoz0h3Y
   KIGaVOeb+YdPM4+WP8s+/YUVTL+O5NBiAiUBrxPpxIYwh/NQl963eIJR8
   8beS9fTNSKsUfg1rTWe+C9fWdXSFdC/8fK8ezxyh1CcqgZ+2LEM2Jl5oo
   ROlyLJ4MTyUrs+j2Z/37W4ze7MeS45xe4hUS0EMjxSI1vxDSFv2kU+Rb6
   A==;
X-CSE-ConnectionGUID: RDh3EQIzS6mBa4PZsHLP5g==
X-CSE-MsgGUID: +GTvsSIQQdW62nLUhnxxxg==
X-IronPort-AV: E=McAfee;i="6700,10204,11321"; a="41790717"
X-IronPort-AV: E=Sophos;i="6.13,221,1732608000"; 
   d="scan'208";a="41790717"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jan 2025 03:26:12 -0800
X-CSE-ConnectionGUID: Q0AUwViFRuyAO6sD6qDqXQ==
X-CSE-MsgGUID: tefsjBKBQGa2QV4VUQQtkQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,221,1732608000"; 
   d="scan'208";a="106793720"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 21 Jan 2025 03:26:02 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1taCON-000Xz5-1J;
	Tue, 21 Jan 2025 11:25:59 +0000
Date: Tue, 21 Jan 2025 19:24:59 +0800
From: kernel test robot <lkp@intel.com>
To: Viresh Kumar <viresh.kumar@linaro.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [linux-next:master 9672/10009]
 drivers/cpufreq/s3c64xx-cpufreq.c:27:28: warning: unused variable
 's3c64xx_dvfs_table'
Message-ID: <202501211941.fsDqBXH4-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   f066b5a6c7a06adfb666b7652cc99b4ff264f4ed
commit: 76b218721e5fd5ac2fc03e1340595c9a56c1613d [9672/10009] cpufreq: s3c64xx: Fix compilation warning
config: x86_64-buildonly-randconfig-005-20250121 (https://download.01.org/0day-ci/archive/20250121/202501211941.fsDqBXH4-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250121/202501211941.fsDqBXH4-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501211941.fsDqBXH4-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/cpufreq/s3c64xx-cpufreq.c:16:
   In file included from include/linux/regulator/consumer.h:35:
   In file included from include/linux/suspend.h:5:
   In file included from include/linux/swap.h:9:
   In file included from include/linux/memcontrol.h:21:
   In file included from include/linux/mm.h:2223:
   include/linux/vmstat.h:518:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     518 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
>> drivers/cpufreq/s3c64xx-cpufreq.c:27:28: warning: unused variable 's3c64xx_dvfs_table' [-Wunused-variable]
      27 | static struct s3c64xx_dvfs s3c64xx_dvfs_table[] = {
         |                            ^~~~~~~~~~~~~~~~~~
   2 warnings generated.


vim +/s3c64xx_dvfs_table +27 drivers/cpufreq/s3c64xx-cpufreq.c

b3748ddd80569e arch/arm/plat-s3c64xx/cpufreq.c   Mark Brown 2009-06-15  26  
b3748ddd80569e arch/arm/plat-s3c64xx/cpufreq.c   Mark Brown 2009-06-15 @27  static struct s3c64xx_dvfs s3c64xx_dvfs_table[] = {
e9c08f0d5737a9 arch/arm/plat-s3c64xx/cpufreq.c   Mark Brown 2009-11-03  28  	[0] = { 1000000, 1150000 },
e9c08f0d5737a9 arch/arm/plat-s3c64xx/cpufreq.c   Mark Brown 2009-11-03  29  	[1] = { 1050000, 1150000 },
e9c08f0d5737a9 arch/arm/plat-s3c64xx/cpufreq.c   Mark Brown 2009-11-03  30  	[2] = { 1100000, 1150000 },
e9c08f0d5737a9 arch/arm/plat-s3c64xx/cpufreq.c   Mark Brown 2009-11-03  31  	[3] = { 1200000, 1350000 },
c6e2d68558b612 drivers/cpufreq/s3c64xx-cpufreq.c Mark Brown 2011-06-08  32  	[4] = { 1300000, 1350000 },
b3748ddd80569e arch/arm/plat-s3c64xx/cpufreq.c   Mark Brown 2009-06-15  33  };
b3748ddd80569e arch/arm/plat-s3c64xx/cpufreq.c   Mark Brown 2009-06-15  34  

:::::: The code at line 27 was first introduced by commit
:::::: b3748ddd80569ec753f62e709629b8c639143222 [ARM] S3C64XX: Initial support for DVFS

:::::: TO: Mark Brown <broonie@opensource.wolfsonmicro.com>
:::::: CC: Ben Dooks <ben-linux@fluff.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
