Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BC47145A05;
	Thu, 27 Feb 2025 01:34:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740620083; cv=none; b=djcqb7jf6kOIntIAhhBQiF/eeHpObAIvn7NwBhIjP/pxbjbnLu6YOANhkvEZ4g7t0iCEcQ21vBLaKlutjUdrLLlB1hwVeYg9yNUKqz+sHDNVi0Dqln9Tfh9fqcoIxhkNy3kNoktSPG3ZxvQUFehiLwOs6BjIc/b+P811hMs/QRo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740620083; c=relaxed/simple;
	bh=3odKXDCT/AK0GrDy/VWYqyS5P1dlm6J4H6J17/oG1aI=;
	h=Date:From:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=RhDNABb0PumIpkKqXPKs6E5Z7c3wToNQlBKT8uiJ+cB+Xr+VJjNTQEWWhT5PP3d1/cSsOx0pCjojcB/GT4w8wcOBjNTIc5sQLDZRGpQtGkp6C0q6VjofqY4gsdp6FuMk2h97UH+WMUl1gbbThxcC+Qz3V0h7PauPvKgkYkbVWDo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lqnsyb4P; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lqnsyb4P"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1740620081; x=1772156081;
  h=date:from:cc:subject:message-id:mime-version;
  bh=3odKXDCT/AK0GrDy/VWYqyS5P1dlm6J4H6J17/oG1aI=;
  b=lqnsyb4PacMjAxZH4aRlTknjuCGIct7sqzIq5XfeCMjJgRsIC7lRcL76
   VKO24ji6+77U0wSPmsbZ6o+/bSMmQE34nnf3ztTD5yeojzzU3YkbXwCsM
   Xkk3xiQFmf14O9RipniFIdfhdKbvnoczc4Rim0t3QbkXfSIavN9P2h8P8
   2pNqWv0c2jgwT0C1OACuk2RPBbtiW+FfulXpnG3OE/9G4WwdrrgsypkXj
   kNo1AgbqdysXcEGSszxzX2GaWqlXwDz3Ds0uMCntvwBYwlS3sUypHLlsI
   qSa3y89WDjTGL0Tg5sW6Imz1FWb/uLqas43qqQ8B6AKlLFnTpyE2QZSsv
   Q==;
X-CSE-ConnectionGUID: 5uobYWV7RTqJyE3hMIbjxw==
X-CSE-MsgGUID: 6qRTW5lzRvOv7DeWtAINjQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11357"; a="41377393"
X-IronPort-AV: E=Sophos;i="6.13,318,1732608000"; 
   d="scan'208";a="41377393"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Feb 2025 17:34:40 -0800
X-CSE-ConnectionGUID: 6CuLgtVTQ72Ug4InhIE9RQ==
X-CSE-MsgGUID: Aune66aeTzSJvzIuzSPyvQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="117793697"
Received: from lkp-server02.sh.intel.com (HELO 76cde6cc1f07) ([10.239.97.151])
  by orviesa008.jf.intel.com with ESMTP; 26 Feb 2025 17:34:39 -0800
Received: from kbuild by 76cde6cc1f07 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tnSnM-000ChA-1u;
	Thu, 27 Feb 2025 01:34:36 +0000
Date: Thu, 27 Feb 2025 09:34:33 +0800
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, llvm@lists.linux.dev
Subject: net/devlink/dev.c:248:20: warning: arithmetic between different
 enumeration types ('enum devlink_reload_limit' and 'enum
 devlink_reload_action')
Message-ID: <202502270907.G5zzEHgz-lkp@intel.com>
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
head:   f4ce1f3318ad4bc12463698696ebc36b145a6aa3
commit: c6ed7d6ef929a4502cc89c90a3c57e8814f4fcc9 devlink: Move devlink dev reload code to dev
date:   2 years, 1 month ago
config: arm-randconfig-004-20250120 (https://download.01.org/0day-ci/archive/20250227/202502270907.G5zzEHgz-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250227/202502270907.G5zzEHgz-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502270907.G5zzEHgz-lkp@intel.com/

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
