Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 097681FCFF3;
	Tue, 11 Feb 2025 13:09:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739279354; cv=none; b=dDYx8gtkMBJoRb90JKT+3JZGQOCeWjYQ+8he/gGS708CYqnC3frRgxn/wtE8ep5T6Bur4Glf8O7NEDhycKZks6sIFQjXkaAL2InaD51GVNHr7tZXIw7CUVLApqcyr1en+7IZi1/WBGfkZDww5PHma2ZOAP8wm4VSpoRDkyPuAnc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739279354; c=relaxed/simple;
	bh=yYvyx+uj/iQrOzVip21IACc+wuwLDKyExXU4FXOTqNU=;
	h=Date:From:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=smRiVXuN87xOuGar1JsjxLirE0WyV6RJW5ASEm7foddXvvX9lKn7+U9kxQEb17iep3pkjNzot3Q3Q03ybxS9zHODrCb96/6SACu8E4B1CxTr7+dS/x1tjoJBPFP532F6exB9pwDO2AcL35Cjtihx1eVK91hsLyCPWbjvSrQw8uE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TbWd3KZ+; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TbWd3KZ+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739279353; x=1770815353;
  h=date:from:cc:subject:message-id:mime-version;
  bh=yYvyx+uj/iQrOzVip21IACc+wuwLDKyExXU4FXOTqNU=;
  b=TbWd3KZ+Gyp+fDFEXNTNnxtAlVNaprTJA/FlmtvlF8DUHgTK5Uf0k0mo
   5+P3dihd1QOw4efQR4u63ABRCbVxl9SYNBxfeQj05q+pGnF57bYQqMdgr
   Bct77/gSKV1b66KFqkARnAKGT6nI+9pD6libtqKouk2YeYpJgJ2yFxJcu
   jAsDNgAVZudILxflpP3WkvjRzSXI7xcD9mPqtDJCQoQaj8N9nRYyIOdo2
   tcf1Lv4UiLNDY8y63g7FVn+AfGUKy5gFNWt87LBjmEygg5uQsWBH/mS+R
   IBsUj8k+36RkJanVlY0b8V/zDQX0CatvGjhAx7PDFi4dpgrOpvRBIoFmr
   g==;
X-CSE-ConnectionGUID: 6HrVk41yQoSjJvul8cyFGw==
X-CSE-MsgGUID: 8qNWaDbQRVCBH0nc8CAKkw==
X-IronPort-AV: E=McAfee;i="6700,10204,11341"; a="39812660"
X-IronPort-AV: E=Sophos;i="6.13,277,1732608000"; 
   d="scan'208";a="39812660"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Feb 2025 05:09:12 -0800
X-CSE-ConnectionGUID: mxIwqcaYR62hvRZsW3xPGQ==
X-CSE-MsgGUID: ONeAdHbcQPirjM8rvDTUTA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,277,1732608000"; 
   d="scan'208";a="112462512"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 11 Feb 2025 05:09:11 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1thq0i-0014Bz-0B;
	Tue, 11 Feb 2025 13:09:08 +0000
Date: Tue, 11 Feb 2025 21:08:36 +0800
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, llvm@lists.linux.dev
Subject: net/devlink/dev.c:248:20: warning: arithmetic between different
 enumeration types ('enum devlink_reload_limit' and 'enum
 devlink_reload_action')
Message-ID: <202502112101.dMerg8Vq-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

CC: linux-kernel@vger.kernel.org
TO: Moshe Shemesh <moshe@nvidia.com>
CC: Jakub Kicinski <kuba@kernel.org>
CC: Jiri Pirko <jiri@nvidia.com>

Hi Moshe,

FYI, the error/warning was bisected to this commit, please ignore it if it's irrelevant.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   febbc555cf0fff895546ddb8ba2c9a523692fb55
commit: c6ed7d6ef929a4502cc89c90a3c57e8814f4fcc9 devlink: Move devlink dev reload code to dev
date:   2 years ago
config: arm-randconfig-004-20250120 (https://download.01.org/0day-ci/archive/20250211/202502112101.dMerg8Vq-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250211/202502112101.dMerg8Vq-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502112101.dMerg8Vq-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from net/devlink/dev.c:7:
   In file included from include/net/genetlink.h:5:
   In file included from include/linux/genetlink.h:5:
   In file included from include/uapi/linux/genetlink.h:6:
   In file included from include/linux/netlink.h:7:
   In file included from include/linux/skbuff.h:17:
   In file included from include/linux/bvec.h:10:
   In file included from include/linux/highmem.h:8:
   In file included from include/linux/cacheflush.h:5:
   In file included from arch/arm/include/asm/cacheflush.h:10:
   In file included from include/linux/mm.h:1856:
   include/linux/vmstat.h:516:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     516 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   In file included from net/devlink/dev.c:9:
   net/devlink/devl_internal.h:21:19: warning: arithmetic between different enumeration types ('enum devlink_reload_limit' and 'enum devlink_reload_action') [-Wenum-enum-conversion]
      21 |         u32 reload_stats[DEVLINK_RELOAD_STATS_ARRAY_SIZE];
         |                          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/devlink/devl_internal.h:18:30: note: expanded from macro 'DEVLINK_RELOAD_STATS_ARRAY_SIZE'
      18 |         (__DEVLINK_RELOAD_LIMIT_MAX * __DEVLINK_RELOAD_ACTION_MAX)
         |          ~~~~~~~~~~~~~~~~~~~~~~~~~~ ^ ~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/devlink/devl_internal.h:22:26: warning: arithmetic between different enumeration types ('enum devlink_reload_limit' and 'enum devlink_reload_action') [-Wenum-enum-conversion]
      22 |         u32 remote_reload_stats[DEVLINK_RELOAD_STATS_ARRAY_SIZE];
         |                                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/devlink/devl_internal.h:18:30: note: expanded from macro 'DEVLINK_RELOAD_STATS_ARRAY_SIZE'
      18 |         (__DEVLINK_RELOAD_LIMIT_MAX * __DEVLINK_RELOAD_ACTION_MAX)
         |          ~~~~~~~~~~~~~~~~~~~~~~~~~~ ^ ~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> net/devlink/dev.c:248:20: warning: arithmetic between different enumeration types ('enum devlink_reload_limit' and 'enum devlink_reload_action') [-Wenum-enum-conversion]
     248 |                 stat_idx = limit * __DEVLINK_RELOAD_ACTION_MAX + action;
         |                            ~~~~~ ^ ~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/devlink/dev.c:349:26: warning: arithmetic between different enumeration types ('enum devlink_reload_limit' and 'enum devlink_reload_action') [-Wenum-enum-conversion]
     349 |         u32 remote_reload_stats[DEVLINK_RELOAD_STATS_ARRAY_SIZE];
         |                                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/devlink/devl_internal.h:18:30: note: expanded from macro 'DEVLINK_RELOAD_STATS_ARRAY_SIZE'
      18 |         (__DEVLINK_RELOAD_LIMIT_MAX * __DEVLINK_RELOAD_ACTION_MAX)
         |          ~~~~~~~~~~~~~~~~~~~~~~~~~~ ^ ~~~~~~~~~~~~~~~~~~~~~~~~~~~
   5 warnings generated.


vim +248 net/devlink/dev.c

   238	
   239	static void
   240	__devlink_reload_stats_update(struct devlink *devlink, u32 *reload_stats,
   241				      enum devlink_reload_limit limit, u32 actions_performed)
   242	{
   243		unsigned long actions = actions_performed;
   244		int stat_idx;
   245		int action;
   246	
   247		for_each_set_bit(action, &actions, __DEVLINK_RELOAD_ACTION_MAX) {
 > 248			stat_idx = limit * __DEVLINK_RELOAD_ACTION_MAX + action;
   249			reload_stats[stat_idx]++;
   250		}
   251		devlink_notify(devlink, DEVLINK_CMD_NEW);
   252	}
   253	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
