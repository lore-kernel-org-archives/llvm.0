Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BE1D26A08F;
	Thu, 30 Apr 2026 06:10:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777529458; cv=none; b=BM6b1jri4RmpypADgKdVsSx1gdDcovH7EvVhFUOoa4D/b198PFkpNG/B/OXh5Cv//IkRVlI7ambOhrLJUXi1jf726jLOYmiUuiNDayCSWPvaa2hlw9MoVcGKW5BkO72w/zCSShT6obYdwAdFdU7AZomCvgiGdOZHWfHg2IvwEV0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777529458; c=relaxed/simple;
	bh=/eh3huzaTXLXEIe6BJhhAV+9eh7dMEa+lkML0SLODZo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=tydR4fB45FjcUeXYDY1MP8qFwonQMf5Q3yvYLZgtpBuD4sAAfZ6P6cYEDSBp4gDeuNsSzB7tyANRWKIlV8Hswyo7JcUu5o32gtUXDpXOjJ9G7lDuiZhKa5QCkP/10A0Qj/si+VQ/GbUihLobLEIEuffuoishIvO6LXn5XxeCFDI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ARnDqlwP; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ARnDqlwP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1777529457; x=1809065457;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=/eh3huzaTXLXEIe6BJhhAV+9eh7dMEa+lkML0SLODZo=;
  b=ARnDqlwP2pUYeFOzDAUwTI2f3730BqHF1cwvngHeMb1SAt4IURlb0o7O
   cHj2xlEkXFyQH3dkjELDShqQYGfOCMC8l8FUG+DsKNIF3nP0iw+fyasgi
   qOwAj8E+luShZtZamG8iLqekwnVobmiD52tHGVAOTagLngueRMsNj9UL8
   qVWXsdh7ZO+MLua/vGll4Dccfu6fuEx1mKZrN5yURel02hxV11gURXDy0
   awB25wUTV67iRe++6GOB5Er2VdsBkeSnarsnyHPo5N0Ind7blX/Ch+mZH
   IDBCFx4Xvxc1AyI/O0axSkZ9sQHphJIUxCYs9EsWFbGYYSP443m3E/8FK
   A==;
X-CSE-ConnectionGUID: 0aq3aKIPSGG8JevLdGrCHA==
X-CSE-MsgGUID: I1iRnHL6RwSnH8W6irgMNQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11771"; a="89564622"
X-IronPort-AV: E=Sophos;i="6.23,207,1770624000"; 
   d="scan'208";a="89564622"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Apr 2026 23:10:49 -0700
X-CSE-ConnectionGUID: 87Cdao3WRne0g9DPMhGu8g==
X-CSE-MsgGUID: ouRDBlQ5RqaMYCOz8yQ8Ng==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,207,1770624000"; 
   d="scan'208";a="227986587"
Received: from lkp-server01.sh.intel.com (HELO aa799cca880d) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 29 Apr 2026 23:10:48 -0700
Received: from kbuild by aa799cca880d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wIKbl-00000000C1U-46VE;
	Thu, 30 Apr 2026 06:10:45 +0000
Date: Thu, 30 Apr 2026 14:10:01 +0800
From: kernel test robot <lkp@intel.com>
To: "Thomas =?utf-8?Q?Wei=C3=9Fschuh"?= <thomas.weissschuh@linutronix.de>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [thomas-weissschuh:b4/riscv-cfi-vdso-alternative 4/4]
 arch/riscv/kernel/alternative.c:210:27: error: use of undeclared identifier
 'vdso_cfi_start'
Message-ID: <202604301435.3ApdMPjV-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/thomas.weissschuh/linux.git b4/riscv-cfi-vdso-alternative
head:   fa83dca7c15f5aefda0432bda4aa4a802766ca70
commit: fa83dca7c15f5aefda0432bda4aa4a802766ca70 [4/4] riscv: alternative: Also patch the CFI vDSO
config: riscv-randconfig-001-20260430 (https://download.01.org/0day-ci/archive/20260430/202604301435.3ApdMPjV-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project 5bac06718f502014fade905512f1d26d578a18f3)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260430/202604301435.3ApdMPjV-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202604301435.3ApdMPjV-lkp@intel.com/

All errors (new ones prefixed by >>):

   arch/riscv/kernel/alternative.c:207:27: error: use of undeclared identifier 'vdso_start'; did you mean 'vfs_stat'?
     207 |                 apply_vdso_alternatives(vdso_start);
         |                                         ^~~~~~~~~~
         |                                         vfs_stat
   include/linux/fs.h:3206:19: note: 'vfs_stat' declared here
    3206 | static inline int vfs_stat(const char __user *filename, struct kstat *stat)
         |                   ^
>> arch/riscv/kernel/alternative.c:210:27: error: use of undeclared identifier 'vdso_cfi_start'
     210 |                 apply_vdso_alternatives(vdso_cfi_start);
         |                                         ^~~~~~~~~~~~~~
   2 errors generated.


vim +/vdso_cfi_start +210 arch/riscv/kernel/alternative.c

   196	
   197	void __init apply_boot_alternatives(void)
   198	{
   199		/* If called on non-boot cpu things could go wrong */
   200		WARN_ON(smp_processor_id() != 0);
   201	
   202		_apply_alternatives((struct alt_entry *)__alt_start,
   203				    (struct alt_entry *)__alt_end,
   204				    RISCV_ALTERNATIVES_BOOT);
   205	
   206		if (IS_ENABLED(CONFIG_MMU))
   207			apply_vdso_alternatives(vdso_start);
   208	
   209		if (IS_ENABLED(CONFIG_RISCV_USER_CFI))
 > 210			apply_vdso_alternatives(vdso_cfi_start);
   211	}
   212	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
