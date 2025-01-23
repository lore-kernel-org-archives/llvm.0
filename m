Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1B1620CCF7;
	Thu, 23 Jan 2025 11:28:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737631689; cv=none; b=SAHyQt6uuuOpJ+Y9evF40RioLfQVgYW7kAjEZAXB7b9hFanB4UxFWy5BBncDNfX+LU74hO3KGXm54zMkcehQuFN3z5bl9ruUrY0wWOyQ5X5+BRq9CKG0fbKwynCeQFQeEXCFTVVLnUJinuUozxLS0II6iADexuZjlVDKXAOdlYY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737631689; c=relaxed/simple;
	bh=vHbakJvsCi9B8Cw1zeMQtg6NtNHek0/F8hDJUHBwZ70=;
	h=Date:From:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=OWYGGpsCqSdEF/SFe7XZLfL8VyYzn7Y2q0mVXJShGUBTJIbTv1QQOPuhdoUMMHWEuzY72RzZM0HBffv7AgePDyxv3TxGSlGLOK2Fn6TzLln7bO75M6U14+OyqDr7dOWUkehsydE4yFAj2aXKpglEHbPUkxm2Pq38/eD8s2QB6Eo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Ov1rDREG; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Ov1rDREG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1737631688; x=1769167688;
  h=date:from:cc:subject:message-id:mime-version;
  bh=vHbakJvsCi9B8Cw1zeMQtg6NtNHek0/F8hDJUHBwZ70=;
  b=Ov1rDREGNu5Lr0bZLIFHVY0lwAE96nQyK2TcKoJqVn0joxUSEoe8tmCC
   nZSaKMnJakylIEQgCW35caHfQKSYksRNBefcDLIVsxy8jUMfzxuOGxjLx
   V7coONE+RDkLShQPl0Ca/iIKw2bCWkq28ClBPvwA6XJxrKuyebd7qBquI
   HjiuaGVgYpX8s29UC5PQyEQXGfIUHSoy8bFVYKK919zx5TD8z42wXcnfv
   0ct+H06YYzcEQtzx3mlrMP2M7V/2qlvXt6xdqQdtFE9em7q8NafYLnx6b
   wlx/18ZWSj8+mXggp2snGJ1kDZDAWqpRZeTEIsfSugX9qXQZf4PnmCyXV
   Q==;
X-CSE-ConnectionGUID: m7HYwKwpSKCvQIkVSgtobw==
X-CSE-MsgGUID: 7eoWrxoMQMyIjpvVAYiGVg==
X-IronPort-AV: E=McAfee;i="6700,10204,11314"; a="49537606"
X-IronPort-AV: E=Sophos;i="6.12,310,1728975600"; 
   d="scan'208";a="49537606"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jan 2025 03:28:07 -0800
X-CSE-ConnectionGUID: KrzqyaS/T9+rCsyvQcrDYw==
X-CSE-MsgGUID: Cp/c/NVmToSIOq1WfHyZvA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="112077678"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 23 Jan 2025 03:28:06 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tavNT-000b7P-1m;
	Thu, 23 Jan 2025 11:28:03 +0000
Date: Thu, 23 Jan 2025 19:27:26 +0800
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, llvm@lists.linux.dev
Subject: net/devlink/dev.c:248:20: warning: arithmetic between different
 enumeration types ('enum devlink_reload_limit' and 'enum
 devlink_reload_action')
Message-ID: <202501231939.ZuULxMdQ-lkp@intel.com>
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
head:   21266b8df5224c4f677acf9f353eecc9094731f0
commit: c6ed7d6ef929a4502cc89c90a3c57e8814f4fcc9 devlink: Move devlink dev reload code to dev
date:   2 years ago
config: arm-randconfig-004-20241229 (https://download.01.org/0day-ci/archive/20250123/202501231939.ZuULxMdQ-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project 096551537b2a747a3387726ca618ceeb3950e9bc)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250123/202501231939.ZuULxMdQ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501231939.ZuULxMdQ-lkp@intel.com/

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
