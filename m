Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3711188A0E;
	Mon, 20 Jan 2025 21:23:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737408236; cv=none; b=IJTKJq/JszJbkoT8k8Uj2SjevE/pnIZJYtMsejOxPl/pbtTRcgLnO5hKG2PL8CP/AfWxkUWYbDWIMUMUYGk+lDwPM2yg3R9XbV90ZbngL6os7qN6zpqFupeserDNnmAf7xUcogftgXR3NmtONz4o/iyWIK6PCN2hoNYTjn7I5HU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737408236; c=relaxed/simple;
	bh=Wx669Eku0p++oxL5aBcxIscOG1U811p95jb+HGHtjA0=;
	h=Date:From:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=D28HezA8a67ajCqwr11VLKDUJ2abpQE+LmyHvrLaMoe+8BvcoyGdbcvvIQO78M9SqGL5mhHrtqsUxDXeGYjr5nqTUiKo/BqwpDtWq44FcEllZ9DvHqggThEakR4DFrVJM210YcfM0zc3J6WDrAgxJBXfy4DQkbhDCWGgvny7ID4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ER+AQqgP; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ER+AQqgP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1737408234; x=1768944234;
  h=date:from:cc:subject:message-id:mime-version;
  bh=Wx669Eku0p++oxL5aBcxIscOG1U811p95jb+HGHtjA0=;
  b=ER+AQqgPB+7A0xCfNdMQNWPuJyzXyhxEV4DcGp+/14ZjblQB21q/VpFX
   m9BXoKUqJ4NCtUDXh/mmhO1t7K9U+JPHPCSjPQ9CkOdDQTxuc2xboXACa
   Bk80HEOmcirFqdncFSsOStDSG42szD85hux1c4aJP5DlPWvYgaQdsN2Bc
   gYkvp0Eo+A2UdhWkg0+HJB1c9rufJ7WMezmteGMiBS+9F1t2Qrm+rzfCe
   5ih28GAxvbXvCiTmtTPPpXB8nA97lR9rwFWEmGkTd5PODdJLKK7ADCIS5
   55GRPWJF00u4q5qfomot5iiSW54L4Uk+CcpzqZYcF2u373/VxeTUunxWS
   Q==;
X-CSE-ConnectionGUID: VIqCQjdhSQ65LQbSmLpLJg==
X-CSE-MsgGUID: /nIA99mxTXCPJlb9NV1pLg==
X-IronPort-AV: E=McAfee;i="6700,10204,11321"; a="48475917"
X-IronPort-AV: E=Sophos;i="6.13,220,1732608000"; 
   d="scan'208";a="48475917"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jan 2025 13:23:52 -0800
X-CSE-ConnectionGUID: HT5kaVDBTeOsCW1fEvY+TQ==
X-CSE-MsgGUID: zi73t1KlTGKwkBMSN8PftA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,220,1732608000"; 
   d="scan'208";a="106434224"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 20 Jan 2025 13:23:51 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tZzFN-000WzA-0c;
	Mon, 20 Jan 2025 21:23:49 +0000
Date: Tue, 21 Jan 2025 05:23:03 +0800
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, llvm@lists.linux.dev
Subject: net/devlink/devl_internal.h:21:19: warning: arithmetic between
 different enumeration types ('enum devlink_reload_limit' and 'enum
 devlink_reload_action')
Message-ID: <202501210517.jThZTX6K-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

CC: linux-kernel@vger.kernel.org
TO: Jakub Kicinski <kuba@kernel.org>
CC: Jacob Keller <jacob.e.keller@intel.com>
CC: Jiri Pirko <jiri@nvidia.com>

Hi Jakub,

FYI, the error/warning still remains.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   ffd294d346d185b70e28b1a28abe367bbfe53c04
commit: 687125b5799cd5120437fa455cfccbe8537916ff devlink: split out core code
date:   2 years, 1 month ago
config: arm-randconfig-004-20241229 (https://download.01.org/0day-ci/archive/20250121/202501210517.jThZTX6K-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project 096551537b2a747a3387726ca618ceeb3950e9bc)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250121/202501210517.jThZTX6K-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501210517.jThZTX6K-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from net/devlink/leftover.c:10:
   In file included from include/linux/etherdevice.h:20:
   In file included from include/linux/if_ether.h:19:
   In file included from include/linux/skbuff.h:17:
   In file included from include/linux/bvec.h:10:
   In file included from include/linux/highmem.h:8:
   In file included from include/linux/cacheflush.h:5:
   In file included from arch/arm/include/asm/cacheflush.h:10:
   In file included from include/linux/mm.h:1856:
   include/linux/vmstat.h:516:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     516 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   In file included from net/devlink/leftover.c:34:
>> net/devlink/devl_internal.h:21:19: warning: arithmetic between different enumeration types ('enum devlink_reload_limit' and 'enum devlink_reload_action') [-Wenum-enum-conversion]
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
   net/devlink/leftover.c:4473:20: warning: arithmetic between different enumeration types ('enum devlink_reload_limit' and 'enum devlink_reload_action') [-Wenum-enum-conversion]
    4473 |                 stat_idx = limit * __DEVLINK_RELOAD_ACTION_MAX + action;
         |                            ~~~~~ ^ ~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/devlink/leftover.c:4521:26: warning: arithmetic between different enumeration types ('enum devlink_reload_limit' and 'enum devlink_reload_action') [-Wenum-enum-conversion]
    4521 |         u32 remote_reload_stats[DEVLINK_RELOAD_STATS_ARRAY_SIZE];
         |                                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/devlink/devl_internal.h:18:30: note: expanded from macro 'DEVLINK_RELOAD_STATS_ARRAY_SIZE'
      18 |         (__DEVLINK_RELOAD_LIMIT_MAX * __DEVLINK_RELOAD_ACTION_MAX)
         |          ~~~~~~~~~~~~~~~~~~~~~~~~~~ ^ ~~~~~~~~~~~~~~~~~~~~~~~~~~~
   5 warnings generated.
--
   In file included from net/devlink/core.c:7:
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
   In file included from net/devlink/core.c:9:
>> net/devlink/devl_internal.h:21:19: warning: arithmetic between different enumeration types ('enum devlink_reload_limit' and 'enum devlink_reload_action') [-Wenum-enum-conversion]
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
   3 warnings generated.


vim +21 net/devlink/devl_internal.h

    16	
    17	#define DEVLINK_RELOAD_STATS_ARRAY_SIZE \
    18		(__DEVLINK_RELOAD_LIMIT_MAX * __DEVLINK_RELOAD_ACTION_MAX)
    19	
    20	struct devlink_dev_stats {
  > 21		u32 reload_stats[DEVLINK_RELOAD_STATS_ARRAY_SIZE];
    22		u32 remote_reload_stats[DEVLINK_RELOAD_STATS_ARRAY_SIZE];
    23	};
    24	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
