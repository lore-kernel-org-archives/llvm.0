Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35AEF38F83;
	Sat, 22 Feb 2025 05:15:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740201334; cv=none; b=G/hNjjgg8P7TT3MMRhimx8QybrbRAhpelQCbkkgTvhWBrfb3xSKO+MNWo+G/MkRLnd+Y3GBTAKErRBMAn3a5euV59rwZl9VnMVe9x0S9IDLZsqjyzy2FE04HN97LrUGljV/9/x8KqFTlL4gc2URvyDiko/hhN6LDjilpnMTAiwg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740201334; c=relaxed/simple;
	bh=FJ3zVMJeoIN044fqK+n90glzBQSH5L52/z6vP49YSQ4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ugto856yHNPSPD7LxdzDgxUkudn9/NU+liFVclR0Y/mVNfmklK156rOfcRpOJPGo0diJb9GU3h2PvH5DQImmdT/HZa2zRGqIJtEAjsGVse732zOz0ZAZCUNkOANVaW2AUjSrM1GrOzRZEJM+X42FylZKgY5hG2yJfBS95h41wps=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IqxqCP0G; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IqxqCP0G"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1740201332; x=1771737332;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=FJ3zVMJeoIN044fqK+n90glzBQSH5L52/z6vP49YSQ4=;
  b=IqxqCP0GvlJ8o1/IKa2SnRjrjXU6Zd+N3POHSv+WxdlCx/WHiqxXEUzf
   BhIGxPIZVf4wd7xSqfGxmmp25Y8K0oyWJVnggSqIrzuDAnHyJxx8PyLmu
   1UXiZ6uYwxWlAqx0fU3taneOSXuRZUkL3WZ97D/eq3Ha6AFGVpZGJihos
   ZgtfnFh5dt9WohrR0NVyX49/57pjFHWUeFKg5DxaQpRqfVHV0/oqEgxnC
   WlnqCEsf/gCC4ui33wBZmUR46dbq0+Hg9lCCDLrk5lC7sozO/SmW2Kx/v
   HS9LXpGmmrhV+pQtC5O0Vg7WvFwYL/Kvi5rnB/XYIBWFp+zPGoB1Illb9
   w==;
X-CSE-ConnectionGUID: ib3fvnRySVimxwXRSYocpg==
X-CSE-MsgGUID: 8ewyDNm0RhW3GfdB3OEFYA==
X-IronPort-AV: E=McAfee;i="6700,10204,11352"; a="40900699"
X-IronPort-AV: E=Sophos;i="6.13,306,1732608000"; 
   d="scan'208";a="40900699"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Feb 2025 21:15:31 -0800
X-CSE-ConnectionGUID: FfwNEWmrSXOUMf+rENoRqQ==
X-CSE-MsgGUID: c3pJCj0jTCqTUVmTGhAf9w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,306,1732608000"; 
   d="scan'208";a="120529176"
Received: from lkp-server02.sh.intel.com (HELO 76cde6cc1f07) ([10.239.97.151])
  by orviesa004.jf.intel.com with ESMTP; 21 Feb 2025 21:15:29 -0800
Received: from kbuild by 76cde6cc1f07 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tlhrD-0006Jv-0I;
	Sat, 22 Feb 2025 05:15:21 +0000
Date: Sat, 22 Feb 2025 13:14:56 +0800
From: kernel test robot <lkp@intel.com>
To: Tudor Ambarus <tudor.ambarus@linaro.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [ambarus:b4/acpm-debugfs 3/4]
 drivers/firmware/samsung/exynos-acpm.h:7:9: warning: '__EXYNOS_ACPM_H__' is
 used as a header guard here, followed by #define of a different macro
Message-ID: <202502221308.l4i4pSeO-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/ambarus/linux-0day b4/acpm-debugfs
head:   bafe7f9a113167725d05a697c67c199f0be52748
commit: 9dd49cfd36484439b89892286b5d0ed7af69e0bd [3/4] firmware: exynos-acpm: move common structures to exynos-acpm.h
config: s390-allmodconfig (https://download.01.org/0day-ci/archive/20250222/202502221308.l4i4pSeO-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250222/202502221308.l4i4pSeO-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502221308.l4i4pSeO-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/firmware/samsung/exynos-acpm.c:14:
   In file included from include/linux/device.h:32:
   In file included from include/linux/device/driver.h:21:
   In file included from include/linux/module.h:19:
   In file included from include/linux/elf.h:6:
   In file included from arch/s390/include/asm/elf.h:181:
   In file included from arch/s390/include/asm/mmu_context.h:11:
   In file included from arch/s390/include/asm/pgalloc.h:18:
   In file included from include/linux/mm.h:2224:
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
   include/linux/vmstat.h:524:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     524 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     525 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   In file included from drivers/firmware/samsung/exynos-acpm.c:29:
>> drivers/firmware/samsung/exynos-acpm.h:7:9: warning: '__EXYNOS_ACPM_H__' is used as a header guard here, followed by #define of a different macro [-Wheader-guard]
       7 | #ifndef __EXYNOS_ACPM_H__
         |         ^~~~~~~~~~~~~~~~~
   drivers/firmware/samsung/exynos-acpm.h:8:9: note: '__EXYNOS_ACPM_H_' is defined here; did you mean '__EXYNOS_ACPM_H__'?
       8 | #define __EXYNOS_ACPM_H_
         |         ^~~~~~~~~~~~~~~~
         |         __EXYNOS_ACPM_H__
   4 warnings generated.


vim +/__EXYNOS_ACPM_H__ +7 drivers/firmware/samsung/exynos-acpm.h

   > 7	#ifndef __EXYNOS_ACPM_H__
     8	#define __EXYNOS_ACPM_H_
     9	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
