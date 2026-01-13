Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6B32389468;
	Tue, 13 Jan 2026 09:17:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768295876; cv=none; b=mYgemPfSojZDP4aHIFdcTys1Ua+DMPSzHrkNyo6FN3tWiKvMihmUxN5QsovpmxyeX3wGy31CuCkP2kFrNXAHDvuN+lL6zlaosquToO003YkgioTFtIprstLMC04KmFKmEqchgt0hUTSa4r4yZLkNNdVoiEpJAMRbJCKPu/Gt8uo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768295876; c=relaxed/simple;
	bh=BlLAv6yHBz65H5mqBAFyuT7pXJkZoVMFJGWvyT/byYk=;
	h=Date:From:To:Cc:Subject:Message-ID; b=H8GGFO7zQDKDmPdMemDItv6IexzMipRkqkbTNcQjEAhOBsnKhezleCJHz/+xkgliME/cT84fh0NUcJUwOY7q6droRRbt4CA9cKxb/+WRs8jtBm4Q23/JoA1bq4W01U1SxvizxEFI3061EBUgxnSGgEZeNHdz5PAXOD4seVTomG8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=b3JmHqXc; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="b3JmHqXc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768295873; x=1799831873;
  h=date:from:to:cc:subject:message-id;
  bh=BlLAv6yHBz65H5mqBAFyuT7pXJkZoVMFJGWvyT/byYk=;
  b=b3JmHqXcU1WcYfgqxYC0iadbkkUlX4sjSi2miaxSuYu2srVOmNvok4cr
   V8T+7dfFklCRmS7ujhfQ1tYRedOP8k6/1PJvI9pEbnqWkcAnX5zsMETsh
   sntcWI2SYgT2n5hagvDt2/FDgdHySgheJ93frGjXwRhsVSncq76asuyyl
   MryZPSVj6p59hevKmZlQD7mHcMUcmIW+JsNQBHG1P2WxH4khm1LUx5UIW
   woLFeKT1TiW9dzDsWtKdk07kZiHF2ZdEtXwI/pErFlc7pruUG587A504P
   65cLoksWM5ilGzyASEVEyq0B8FhgNAGg4CxK2kjFvcmR0D9PEu1hbE/pU
   g==;
X-CSE-ConnectionGUID: twIavD2cSQGUEASWew8ofA==
X-CSE-MsgGUID: 7h2xzxBYQB+hG8WNJUPyRg==
X-IronPort-AV: E=McAfee;i="6800,10657,11669"; a="69498673"
X-IronPort-AV: E=Sophos;i="6.21,222,1763452800"; 
   d="scan'208";a="69498673"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jan 2026 01:17:46 -0800
X-CSE-ConnectionGUID: nGndZZ/bQS6QvT2A9f8Mkw==
X-CSE-MsgGUID: fN5tICnQSLeUWxGUk8BddA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,222,1763452800"; 
   d="scan'208";a="204230238"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 13 Jan 2026 01:17:45 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vfaX0-00000000EWi-3LSx;
	Tue, 13 Jan 2026 09:17:42 +0000
Date: Tue, 13 Jan 2026 17:17:22 +0800
From: kernel test robot <lkp@intel.com>
To: Gregory Price <gourry@gourry.net>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [gourryinverse:scratch/gourry/cxl/controllers/v2 6/6]
 drivers/cxl/core/memctrl/sysram_region.c:267:7: error: use of undeclared
 identifier 'MMOP_OFFLINE'; did you mean 'MEM_OFFLINE'?
Message-ID: <202601131751.firIxiyH-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://github.com/gourryinverse/linux scratch/gourry/cxl/controllers/v2
head:   dcbd460f630113f17cb71133f44920a1f35c2605
commit: 9a7e9f00bdcec2e1a0f8843abe36f31f75d00493 [6/6] cxl/sysram: disallow onlining in ZONE_NORMAL if state is movable only
config: arm-randconfig-003-20260113 (https://download.01.org/0day-ci/archive/20260113/202601131751.firIxiyH-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 9b8addffa70cee5b2acc5454712d9cf78ce45710)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260113/202601131751.firIxiyH-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601131751.firIxiyH-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/cxl/core/memctrl/sysram_region.c:92:7: error: call to undeclared function 'offline_and_remove_memory'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
      92 |         rc = offline_and_remove_memory(range.start, range_len(&range));
         |              ^
   drivers/cxl/core/memctrl/sysram_region.c:149:7: error: call to undeclared function 'walk_memory_blocks'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     149 |         rc = walk_memory_blocks(range->start, range_len(range),
         |              ^
   drivers/cxl/core/memctrl/sysram_region.c:162:7: error: call to undeclared function 'walk_memory_blocks'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     162 |         rc = walk_memory_blocks(range->start, range_len(range),
         |              ^
   drivers/cxl/core/memctrl/sysram_region.c:201:32: error: use of undeclared identifier 'MMOP_ONLINE_MOVABLE'
     201 |         if (data->last_online_type != MMOP_ONLINE_MOVABLE)
         |                                       ^~~~~~~~~~~~~~~~~~~
   drivers/cxl/core/memctrl/sysram_region.c:230:17: error: use of undeclared identifier 'MMOP_ONLINE_MOVABLE'
     230 |                 online_type = MMOP_ONLINE_MOVABLE;
         |                               ^~~~~~~~~~~~~~~~~~~
   drivers/cxl/core/memctrl/sysram_region.c:232:17: error: use of undeclared identifier 'MMOP_ONLINE_KERNEL'
     232 |                 online_type = MMOP_ONLINE_KERNEL;
         |                               ^~~~~~~~~~~~~~~~~~
   drivers/cxl/core/memctrl/sysram_region.c:234:17: error: use of undeclared identifier 'MMOP_ONLINE_MOVABLE'
     234 |                 online_type = MMOP_ONLINE_MOVABLE;
         |                               ^~~~~~~~~~~~~~~~~~~
   drivers/cxl/core/memctrl/sysram_region.c:263:7: error: use of undeclared identifier 'MMOP_ONLINE_MOVABLE'
     263 |         case MMOP_ONLINE_MOVABLE:
         |              ^~~~~~~~~~~~~~~~~~~
   drivers/cxl/core/memctrl/sysram_region.c:265:7: error: use of undeclared identifier 'MMOP_ONLINE_KERNEL'
     265 |         case MMOP_ONLINE_KERNEL:
         |              ^~~~~~~~~~~~~~~~~~
>> drivers/cxl/core/memctrl/sysram_region.c:267:7: error: use of undeclared identifier 'MMOP_OFFLINE'; did you mean 'MEM_OFFLINE'?
     267 |         case MMOP_OFFLINE:
         |              ^~~~~~~~~~~~
         |              MEM_OFFLINE
   include/linux/memory.h:71:2: note: 'MEM_OFFLINE' declared here
      71 |         MEM_OFFLINE,            /* exposed to userspace */
         |         ^
   drivers/cxl/core/memctrl/sysram_region.c:280:20: error: use of undeclared identifier 'MMOP_OFFLINE'; did you mean 'MEM_OFFLINE'?
     280 |         int online_type = MMOP_OFFLINE;
         |                           ^~~~~~~~~~~~
         |                           MEM_OFFLINE
   include/linux/memory.h:71:2: note: 'MEM_OFFLINE' declared here
      71 |         MEM_OFFLINE,            /* exposed to userspace */
         |         ^
   drivers/cxl/core/memctrl/sysram_region.c:299:17: error: use of undeclared identifier 'MMOP_ONLINE_MOVABLE'
     299 |                 online_type = MMOP_ONLINE_MOVABLE;
         |                               ^~~~~~~~~~~~~~~~~~~
   drivers/cxl/core/memctrl/sysram_region.c:302:17: error: use of undeclared identifier 'MMOP_ONLINE'; did you mean 'MEM_ONLINE'?
     302 |                 online_type = MMOP_ONLINE;
         |                               ^~~~~~~~~~~
         |                               MEM_ONLINE
   include/linux/memory.h:69:2: note: 'MEM_ONLINE' declared here
      69 |         MEM_ONLINE,             /* exposed to userspace */
         |         ^
   drivers/cxl/core/memctrl/sysram_region.c:316:21: error: use of undeclared identifier 'MMOP_OFFLINE'; did you mean 'MEM_OFFLINE'?
     316 |         if (online_type != MMOP_OFFLINE)
         |                            ^~~~~~~~~~~~
         |                            MEM_OFFLINE
   include/linux/memory.h:71:2: note: 'MEM_OFFLINE' declared here
      71 |         MEM_OFFLINE,            /* exposed to userspace */
         |         ^
   drivers/cxl/core/memctrl/sysram_region.c:343:7: error: call to undeclared function 'add_memory_driver_managed'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     343 |         rc = add_memory_driver_managed(data->mgid, range.start,
         |              ^
   drivers/cxl/core/memctrl/sysram_region.c:345:12: error: use of undeclared identifier 'MHP_NID_IS_MGID'
     345 |                                        MHP_NID_IS_MGID);
         |                                        ^~~~~~~~~~~~~~~
   drivers/cxl/core/memctrl/sysram_region.c:379:7: error: call to undeclared function 'offline_and_remove_memory'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     379 |         if (!offline_and_remove_memory(range.start, range_len(&range))) {
         |              ^
   drivers/cxl/core/memctrl/sysram_region.c:382:3: error: call to undeclared function 'memory_group_unregister'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     382 |                 memory_group_unregister(data->mgid);
         |                 ^
   drivers/cxl/core/memctrl/sysram_region.c:400:2: error: use of undeclared identifier 'mhp_t'
     400 |         mhp_t mhp_flags;
         |         ^~~~~
   fatal error: too many errors emitted, stopping now [-ferror-limit=]
   20 errors generated.


vim +267 drivers/cxl/core/memctrl/sysram_region.c

   252	
   253	static ssize_t state_show(struct device *dev,
   254				  struct device_attribute *attr, char *buf)
   255	{
   256		struct cxl_sysram_data *data;
   257	
   258		data = dev_get_drvdata(dev);
   259		if (!data)
   260			return -ENODEV;
   261	
   262		switch (data->last_online_type) {
   263		case MMOP_ONLINE_MOVABLE:
   264			return sysfs_emit(buf, "online\n");
   265		case MMOP_ONLINE_KERNEL:
   266			return sysfs_emit(buf, "online_normal\n");
 > 267		case MMOP_OFFLINE:
   268		default:
   269			return sysfs_emit(buf, "offline\n");
   270		}
   271	}
   272	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
