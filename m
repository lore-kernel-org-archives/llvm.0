Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C03D83346B9;
	Wed,  7 Jan 2026 21:36:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767821787; cv=none; b=H+Mj9WklaamsTG5IoCDLMqPwRDM6f5uz6boja+iyq7BCBP5kdA7SAar+zgIUo10wWbS1X9zvTqu17kyG+Sx3+YAhlMLajwyWTYitAZygZvVmnXjpSIxRunsPIiFo+r7tLXU2exdbUSZ+Gj/kjv6CfAu2Kqhpa1ayXJlBtXw4DGc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767821787; c=relaxed/simple;
	bh=3v+ZAxNbgojIqD5ADHxnVdpIMpCb70S6SqyAdqQGh40=;
	h=Date:From:To:Cc:Subject:Message-ID; b=BTRTRqyi2eWxDL7Ef24FuLJNKic586L9b/UN1Ut6KBXI2HoVThuV+DLoT5fXYOPGlxE1+8S6QxlpHJlkCCKfJUp5ldAz8SofVxWc7xemu2U5rmvYEnfm9SJjYFRsqTDMQQNVqjcLRuj+k2h6GL9UVJaSUistl40oKLYndaxikbk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IBExzm5T; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IBExzm5T"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1767821786; x=1799357786;
  h=date:from:to:cc:subject:message-id;
  bh=3v+ZAxNbgojIqD5ADHxnVdpIMpCb70S6SqyAdqQGh40=;
  b=IBExzm5TZaBYUvy/NH0bUMbCUvCySGaSJjiHHjkdLzJZMJNBwwIMc60v
   Jnl4UB1F8T2/r1weRmgSfUN3Ft2ST8U8Xv4mKJMeCYx7RwbXuiQaTBDKG
   Ri9WXGY4xM3GfJ7bGK+A9tDAAsOI9WdkXQSM6sDvNbVHx18xnehxWBoo1
   QVL+PvQaZURoMIgyutSn57P3t3zSkfDqe3hraipwDCGjNce35p2NvUfmj
   cOq7+i+9/oJWLehwCxEbyPUXrybTEencj0sdFPdy06wSJsdSeSBHvtp1N
   BMJ5eeSlN4bgVqtvbNW+Pokin8AnPljdfbRrQ4Ua/XRnk5eHWQ/RfEgUD
   Q==;
X-CSE-ConnectionGUID: vzYigAi5QSuxJhCQ8vDhIw==
X-CSE-MsgGUID: ThrlTtMaQh6F3fwrWhK0SA==
X-IronPort-AV: E=McAfee;i="6800,10657,11664"; a="91857500"
X-IronPort-AV: E=Sophos;i="6.21,209,1763452800"; 
   d="scan'208";a="91857500"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jan 2026 13:36:23 -0800
X-CSE-ConnectionGUID: N8ejuAXaQHeTHlBHvjBpMA==
X-CSE-MsgGUID: 5xRWHI3RR9epGxceg3CEjA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,209,1763452800"; 
   d="scan'208";a="203291808"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 07 Jan 2026 13:36:21 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vdbCT-000000004BN-0sDx;
	Wed, 07 Jan 2026 21:36:17 +0000
Date: Thu, 08 Jan 2026 05:36:09 +0800
From: kernel test robot <lkp@intel.com>
To: Gregory Price <gourry@gourry.net>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [gourryinverse:scratch/gourry/isolation/v3 1/9]
 include/linux/node.h:108:75: error: expected ';' after return statement
Message-ID: <202601080507.ZGLRFGGY-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://github.com/gourryinverse/linux scratch/gourry/isolation/v3
head:   8a4f71e8f0a8aef992da7df176a352073872a47c
commit: c96cbb611777a60e4328fc821843d1bc092dcca1 [1/9] numa,memory_hotplug: create N_PRIVATE (Private Nodes)
config: i386-buildonly-randconfig-003-20260107 (https://download.01.org/0day-ci/archive/20260108/202601080507.ZGLRFGGY-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260108/202601080507.ZGLRFGGY-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601080507.ZGLRFGGY-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from arch/x86/kernel/asm-offsets.c:14:
   In file included from include/linux/suspend.h:5:
   In file included from include/linux/swap.h:11:
>> include/linux/node.h:108:75: error: expected ';' after return statement
     108 | static inline int node_mark_private(int nid, bool enable) { return -ENODEV }
         |                                                                           ^
         |                                                                           ;
   1 error generated.
   make[3]: *** [scripts/Makefile.build:182: arch/x86/kernel/asm-offsets.s] Error 1 shuffle=3964712368
   make[3]: Target 'prepare' not remade because of errors.
   make[2]: *** [Makefile:1314: prepare0] Error 2 shuffle=3964712368
   make[2]: Target 'prepare' not remade because of errors.
   make[1]: *** [Makefile:248: __sub-make] Error 2 shuffle=3964712368
   make[1]: Target 'prepare' not remade because of errors.
   make: *** [Makefile:248: __sub-make] Error 2 shuffle=3964712368
   make: Target 'prepare' not remade because of errors.


vim +108 include/linux/node.h

   102	
   103	static inline void node_update_perf_attrs(unsigned int nid,
   104						  struct access_coordinate *coord,
   105						  enum access_coordinate_class access)
   106	{
   107	}
 > 108	static inline int node_mark_private(int nid, bool enable) { return -ENODEV }
   109	#endif
   110	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
