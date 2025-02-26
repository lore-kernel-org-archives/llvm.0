Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A5C116F288;
	Wed, 26 Feb 2025 12:02:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740571378; cv=none; b=dmeBFmeHqREwPYB7EPy080Cr5j/7ChNla3ikeGznapdUzQFiaZvw85RuoF/BE++tS5k+w1oggLYvEVVEZtcJ/qkR3871sd+YM3ihstglQUNqOOZ/6jhp27U2+RxKliz7BZL4AvEJfsUBI8DOJMwKKeSO1q7e4RXM7uLjYAHkHXI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740571378; c=relaxed/simple;
	bh=02arTK5U8nSFFgyWDY4YOF157NyAQwqN7gn/CcW46hA=;
	h=Date:From:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=s6MK817Uroqoeybn8MJO7PhgItUtHtyJh5x6qjr1uIcCLzUlE1YiT+mB43FqBLSslYcAbnqY8DJoQ8Or163uO9lH05SdMzapUQf7mq9FkDIdjtJ9g6KGYnHz0lAxvJBvYgbbEelYyLpcl1WJ4zl+gKVZ4rW6+j5ays3Zt1mip1o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dP+eKAzy; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dP+eKAzy"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1740571376; x=1772107376;
  h=date:from:cc:subject:message-id:mime-version;
  bh=02arTK5U8nSFFgyWDY4YOF157NyAQwqN7gn/CcW46hA=;
  b=dP+eKAzy95bZ4VCG2G1kJM7JVWmueeb9jO/9rLy88tID11SkPDR1wHMk
   9P3zlTtaBpxaK0a7Wy1d48x6QkGR8KhZ4lYFgHLupPlUab5fiuqYJ2vAY
   TT/QfYgYlHCKnvTod6V/z9vD6O5W3cZU1Dp81663tVmvz/03DLATRVclV
   lV2ax5pg0ndrK8f08pRonA15MF1N4C2LYV4y3TUgRdxrD+3snfBR86G0O
   eT4MzezYhFdz+owtitFCYso631aBJUrihxjvSMoZpBNKzcWjfzq4d3HZ4
   1KQpxWYsEYC5QD+/VlOFnogaaoaZV6b+Hi/ug9DLKUwq5u2vLc1QzudBD
   Q==;
X-CSE-ConnectionGUID: 1YGNaDYyTlqbKcBtUdOzdg==
X-CSE-MsgGUID: dwFx8w2gTLS/rESraAigLg==
X-IronPort-AV: E=McAfee;i="6700,10204,11357"; a="29005230"
X-IronPort-AV: E=Sophos;i="6.13,317,1732608000"; 
   d="scan'208";a="29005230"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Feb 2025 04:02:54 -0800
X-CSE-ConnectionGUID: tn9ckqJOQPq+MxA6pxZyiA==
X-CSE-MsgGUID: UWG89gT/QjWlQPYWf/jWPA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,317,1732608000"; 
   d="scan'208";a="121679941"
Received: from lkp-server02.sh.intel.com (HELO 76cde6cc1f07) ([10.239.97.151])
  by orviesa004.jf.intel.com with ESMTP; 26 Feb 2025 04:02:53 -0800
Received: from kbuild by 76cde6cc1f07 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tnG7m-000Bdx-2O;
	Wed, 26 Feb 2025 12:02:50 +0000
Date: Wed, 26 Feb 2025 20:02:08 +0800
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, llvm@lists.linux.dev
Subject: net/devlink/devl_internal.h:21:19: warning: arithmetic between
 different enumeration types ('enum devlink_reload_limit' and 'enum
 devlink_reload_action')
Message-ID: <202502261953.yIN80CbJ-lkp@intel.com>
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
head:   ac9c34d1e45a4c25174ced4fc0cfc33ff3ed08c7
commit: 687125b5799cd5120437fa455cfccbe8537916ff devlink: split out core code
date:   2 years, 2 months ago
config: arm-randconfig-004-20250120 (https://download.01.org/0day-ci/archive/20250226/202502261953.yIN80CbJ-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250226/202502261953.yIN80CbJ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502261953.yIN80CbJ-lkp@intel.com/

All warnings (new ones prefixed by >>):

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
--
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
