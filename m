Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB9AC1DB13A;
	Wed, 10 Dec 2025 06:49:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765349390; cv=none; b=oIJZJ8QSfrLgH1lvt0OsJO+nf5d2nsXydZtSLxYS/6rKnXZdLv0WP+qdYI6VswAP5l2borZEfE6BHjaYTTL25ROxfC7bGOOUNCte5lmQSJEH5qXkSoVFk0rAysmn8rkfFbyN0qPVNqIMwdWu4gK8UQEq/zk9ZuKCpkcx7akZQfM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765349390; c=relaxed/simple;
	bh=k7Mbz/lSx0PR+8ACqFb+25nUl0L7rek8WvPKA5cNgAc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=fCFMiAGDAj/usaE3RD2HNE+U3f1GWaJH5lapnVCJHRpzPyCVC2BMZrlR/mjbQr+6PB0kIXD0aE2vahMW05ujeXKZCQ+K/SyQ/Gxe5tn1ZP6A4zQPpDfH4ukhULk/R9s9yNhfeDBd5HUsd17fCNHtj5sOeZgA269ivsC9ek2hlO8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=U28HUNvo; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="U28HUNvo"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765349389; x=1796885389;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=k7Mbz/lSx0PR+8ACqFb+25nUl0L7rek8WvPKA5cNgAc=;
  b=U28HUNvo4YjeiiJHU3Zy+mV+dIod1JfvQfLOA6p4QdZDX5ZM2oudXEsz
   /oNEVrb2SrveHQSeNK9NCcaVYZQ1iI6fu7KmyMJGkCoW83upgNip2YtYi
   NABdu0GfuEZq1hkJi+yFCd34H5lqSmIg1R3gBYMPJEdaDCQkdz2yZETOI
   kY8/c9nsZJtimQ5VuIJEgf7RmUlrfkyojUP3Q011CKJogCpQ3eKTPMmDC
   UNqXUVTv3EpsBQmyI5hfCwpzDrB5QckmYuyMIE+KUFdxmCwZwWmeaAAOH
   NMr+7z0SVQkIEVwileXUOs+o5t+zn1ca4fepLPpFRHLmZSLtmBiNemfts
   A==;
X-CSE-ConnectionGUID: 6T+yeG/mQKq0oo617SU08Q==
X-CSE-MsgGUID: Yhvku4LGTAKLxNub8jAvVQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11637"; a="67040745"
X-IronPort-AV: E=Sophos;i="6.20,263,1758610800"; 
   d="scan'208";a="67040745"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Dec 2025 22:49:48 -0800
X-CSE-ConnectionGUID: RqPUzAhQQeC6hDZygBQxEQ==
X-CSE-MsgGUID: labhprqXTyi+SWCIGVr1fQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,263,1758610800"; 
   d="scan'208";a="196186608"
Received: from lkp-server01.sh.intel.com (HELO d335e3c6db51) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 09 Dec 2025 22:49:47 -0800
Received: from kbuild by d335e3c6db51 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vTE1A-000000002lt-1yfq;
	Wed, 10 Dec 2025 06:49:44 +0000
Date: Wed, 10 Dec 2025 14:49:28 +0800
From: kernel test robot <lkp@intel.com>
To: Riana Tauro <riana.tauro@intel.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: [linux-next:master 13941/14066]
 drivers/gpu/drm/xe/xe_survivability_mode.c:139:6: warning: variable 'index'
 set but not used
Message-ID: <202512101459.EEsMhcKQ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   008d3547aae5bc86fac3eda317489169c3fda112
commit: f4e9fc967afdb53b1203f894fb4b68451a7fe202 [13941/14066] drm/xe/xe_survivability: Redesign survivability mode
config: sparc64-randconfig-001-20251210 (https://download.01.org/0day-ci/archive/20251210/202512101459.EEsMhcKQ-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 6ec8c4351cfc1d0627d1633b02ea787bd29c77d8)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251210/202512101459.EEsMhcKQ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512101459.EEsMhcKQ-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/gpu/drm/xe/xe_survivability_mode.c:139:6: warning: variable 'index' set but not used [-Wunused-but-set-variable]
     139 |         int index;
         |             ^
   1 warning generated.


vim +/index +139 drivers/gpu/drm/xe/xe_survivability_mode.c

5e940312a2ac64b Riana Tauro 2025-01-28  132  
5e940312a2ac64b Riana Tauro 2025-01-28  133  static void populate_survivability_info(struct xe_device *xe)
5e940312a2ac64b Riana Tauro 2025-01-28  134  {
5e940312a2ac64b Riana Tauro 2025-01-28  135  	struct xe_survivability *survivability = &xe->survivability;
f4e9fc967afdb53 Riana Tauro 2025-12-08  136  	u32 *info = survivability->info;
5e940312a2ac64b Riana Tauro 2025-01-28  137  	struct xe_mmio *mmio;
5e940312a2ac64b Riana Tauro 2025-01-28  138  	u32 id = 0, reg_value;
5e940312a2ac64b Riana Tauro 2025-01-28 @139  	int index;
5e940312a2ac64b Riana Tauro 2025-01-28  140  
5e940312a2ac64b Riana Tauro 2025-01-28  141  	mmio = xe_root_tile_mmio(xe);
f4e9fc967afdb53 Riana Tauro 2025-12-08  142  	set_survivability_info(mmio, info, CAPABILITY_INFO);
f4e9fc967afdb53 Riana Tauro 2025-12-08  143  	reg_value = info[CAPABILITY_INFO];
5e940312a2ac64b Riana Tauro 2025-01-28  144  
5e940312a2ac64b Riana Tauro 2025-01-28  145  	if (reg_value & HISTORY_TRACKING) {
f4e9fc967afdb53 Riana Tauro 2025-12-08  146  		set_survivability_info(mmio, info, POSTCODE_TRACE);
5e940312a2ac64b Riana Tauro 2025-01-28  147  
f4e9fc967afdb53 Riana Tauro 2025-12-08  148  		if (reg_value & OVERFLOW_SUPPORT)
f4e9fc967afdb53 Riana Tauro 2025-12-08  149  			set_survivability_info(mmio, info, POSTCODE_TRACE_OVERFLOW);
5e940312a2ac64b Riana Tauro 2025-01-28  150  	}
5e940312a2ac64b Riana Tauro 2025-01-28  151  
5e940312a2ac64b Riana Tauro 2025-01-28  152  	if (reg_value & AUXINFO_SUPPORT) {
5e940312a2ac64b Riana Tauro 2025-01-28  153  		id = REG_FIELD_GET(AUXINFO_REG_OFFSET, reg_value);
5e940312a2ac64b Riana Tauro 2025-01-28  154  
f4e9fc967afdb53 Riana Tauro 2025-12-08  155  		for (index = 0; id >= AUX_INFO0 && id < MAX_SCRATCH_REG; index++) {
f4e9fc967afdb53 Riana Tauro 2025-12-08  156  			set_survivability_info(mmio, info, id);
f4e9fc967afdb53 Riana Tauro 2025-12-08  157  			id = aux_history_offset(info[id]);
5e940312a2ac64b Riana Tauro 2025-01-28  158  		}
5e940312a2ac64b Riana Tauro 2025-01-28  159  	}
5e940312a2ac64b Riana Tauro 2025-01-28  160  }
5e940312a2ac64b Riana Tauro 2025-01-28  161  

:::::: The code at line 139 was first introduced by commit
:::::: 5e940312a2ac64ba0d6239aff72135226818b238 drm/xe: Add functions and sysfs for boot survivability

:::::: TO: Riana Tauro <riana.tauro@intel.com>
:::::: CC: Rodrigo Vivi <rodrigo.vivi@intel.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
