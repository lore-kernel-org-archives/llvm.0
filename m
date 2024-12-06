Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 366AA152166;
	Fri,  6 Dec 2024 17:46:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733507166; cv=none; b=N+hFjbE0NEAbkWRFZjWmozpddXEe16WZ7Q1SeXRqV+7BpvBdteXMxR6KbWMWBA0XWASlTxknV09Bcj1NPtfN6hzRNa3smFH1o/5sIK5b9Jp1kFIkpzl65yq392J+g2mVvJZ5OB4z6M0RDnXThrKa7hVAZam2k/NrUWejssf4T48=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733507166; c=relaxed/simple;
	bh=yY16x5ZoPPPDidJ3jf+fEuFM9l7C7gBiXdyzZxMEdyA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=PSO6Fvuv8utakvHvVHwYCvUZnXGMzfD8LeehJsbXvhN2CzorVCEHwa0O4FD1iDUIUgvw1ZjnrfhtU+v7Y7ZFz9aBEG1BBdDajKk3mUssRXwVli5zIzCndgy+bgxK+zCh1cx4et0QlU6QLIYxr9ok7RI41VMlhQAITWfL5BjN4zQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lFqcuZlL; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lFqcuZlL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1733507164; x=1765043164;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=yY16x5ZoPPPDidJ3jf+fEuFM9l7C7gBiXdyzZxMEdyA=;
  b=lFqcuZlL4cSRFr1Z/YbThVEB0yfxREeBY29Ycbiwwq+Cma0Eh6+opCVn
   Yod/oC6xL/4abB4c+M5NYM2N3nYtRP+fieX4nz3ChCal24AZIuvTwhuCc
   qnCwjBxHeAkHh5wrCxcF3yQIaBxWlt6NO5nhAsNh/Zav0/kw5yvkNj1On
   lbxIJFAKQ+DtSZvsQfFGRK08gK+EEEHRGA5QAA6roro2FYM/qDu34iX5T
   JtrUMaURjdSFYY0TrpIrU9gJBhzflS/sO+odLijUaNs99+pAPL2fL2YLl
   /iaA+tDgm5FKW7JDPt7/P7zPBSAYFHwe4vgypD3RO/+bztJtCdITkTqF0
   w==;
X-CSE-ConnectionGUID: evwJ9HcpRRicqdqCgzlL4g==
X-CSE-MsgGUID: Qnrzulr6RHOl1BFbZ8gETA==
X-IronPort-AV: E=McAfee;i="6700,10204,11278"; a="36702804"
X-IronPort-AV: E=Sophos;i="6.12,213,1728975600"; 
   d="scan'208";a="36702804"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Dec 2024 09:46:02 -0800
X-CSE-ConnectionGUID: QFG2ICM6RFawm048KCYgiA==
X-CSE-MsgGUID: p2Rn6UjDQ6qiFK+OsN9G7Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,213,1728975600"; 
   d="scan'208";a="94827389"
Received: from lkp-server01.sh.intel.com (HELO 82a3f569d0cb) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 06 Dec 2024 09:46:00 -0800
Received: from kbuild by 82a3f569d0cb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tJcOr-00028R-1F;
	Fri, 06 Dec 2024 17:45:57 +0000
Date: Sat, 7 Dec 2024 01:45:20 +0800
From: kernel test robot <lkp@intel.com>
To: David Laight <David.Laight@aculab.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Andrew Morton <akpm@linux-foundation.org>,
	Linux Memory Management List <linux-mm@kvack.org>
Subject: [linux-next:master 1998/2197] block/blk-iocost.c:1101:11: error:
 call to '__compiletime_assert_762' declared with 'error' attribute: clamp()
 low limit 1 greater than high limit active
Message-ID: <202412070124.l0kv7TqZ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   ebe1b11614e079c5e366ce9bd3c8f44ca0fbcc1b
commit: c64c5a658519e4a0342e1e5c9b38d1413c7ec422 [1998/2197] minmax.h: simplify the variants of clamp()
config: s390-allmodconfig (https://download.01.org/0day-ci/archive/20241207/202412070124.l0kv7TqZ-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241207/202412070124.l0kv7TqZ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412070124.l0kv7TqZ-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from block/blk-iocost.c:176:
   In file included from include/linux/module.h:19:
   In file included from include/linux/elf.h:6:
   In file included from arch/s390/include/asm/elf.h:181:
   In file included from arch/s390/include/asm/mmu_context.h:11:
   In file included from arch/s390/include/asm/pgalloc.h:18:
   In file included from include/linux/mm.h:2223:
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
   include/linux/vmstat.h:518:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     518 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   include/linux/vmstat.h:524:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     524 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     525 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
>> block/blk-iocost.c:1101:11: error: call to '__compiletime_assert_762' declared with 'error' attribute: clamp() low limit 1 greater than high limit active
    1101 |                 inuse = clamp_t(u32, inuse, 1, active);
         |                         ^
   include/linux/minmax.h:220:36: note: expanded from macro 'clamp_t'
     220 | #define clamp_t(type, val, lo, hi) __careful_clamp(type, val, lo, hi)
         |                                    ^
   include/linux/minmax.h:197:2: note: expanded from macro '__careful_clamp'
     197 |         __clamp_once(type, val, lo, hi, __UNIQUE_ID(v_), __UNIQUE_ID(l_), __UNIQUE_ID(h_))
         |         ^
   include/linux/minmax.h:190:2: note: expanded from macro '__clamp_once'
     190 |         BUILD_BUG_ON_MSG(statically_true(ulo > uhi),                            \
         |         ^
   note: (skipping 2 expansions in backtrace; use -fmacro-backtrace-limit=0 to see all)
   include/linux/compiler_types.h:530:2: note: expanded from macro '_compiletime_assert'
     530 |         __compiletime_assert(condition, msg, prefix, suffix)
         |         ^
   include/linux/compiler_types.h:523:4: note: expanded from macro '__compiletime_assert'
     523 |                         prefix ## suffix();                             \
         |                         ^
   <scratch space>:16:1: note: expanded from here
      16 | __compiletime_assert_762
         | ^
>> block/blk-iocost.c:1101:11: error: call to '__compiletime_assert_762' declared with 'error' attribute: clamp() low limit 1 greater than high limit active
   include/linux/minmax.h:220:36: note: expanded from macro 'clamp_t'
     220 | #define clamp_t(type, val, lo, hi) __careful_clamp(type, val, lo, hi)
         |                                    ^
   include/linux/minmax.h:197:2: note: expanded from macro '__careful_clamp'
     197 |         __clamp_once(type, val, lo, hi, __UNIQUE_ID(v_), __UNIQUE_ID(l_), __UNIQUE_ID(h_))
         |         ^
   include/linux/minmax.h:190:2: note: expanded from macro '__clamp_once'
     190 |         BUILD_BUG_ON_MSG(statically_true(ulo > uhi),                            \
         |         ^
   note: (skipping 2 expansions in backtrace; use -fmacro-backtrace-limit=0 to see all)
   include/linux/compiler_types.h:530:2: note: expanded from macro '_compiletime_assert'
     530 |         __compiletime_assert(condition, msg, prefix, suffix)
         |         ^
   include/linux/compiler_types.h:523:4: note: expanded from macro '__compiletime_assert'
     523 |                         prefix ## suffix();                             \
         |                         ^
   <scratch space>:16:1: note: expanded from here
      16 | __compiletime_assert_762
         | ^
   4 warnings and 2 errors generated.


vim +1101 block/blk-iocost.c

7caa47151ab2e6 Tejun Heo   2019-08-28  1078  
7caa47151ab2e6 Tejun Heo   2019-08-28  1079  /*
7caa47151ab2e6 Tejun Heo   2019-08-28  1080   * Update @iocg's `active` and `inuse` to @active and @inuse, update level
b0853ab4a238c5 Tejun Heo   2020-09-01  1081   * weight sums and propagate upwards accordingly. If @save, the current margin
b0853ab4a238c5 Tejun Heo   2020-09-01  1082   * is saved to be used as reference for later inuse in-period adjustments.
7caa47151ab2e6 Tejun Heo   2019-08-28  1083   */
b0853ab4a238c5 Tejun Heo   2020-09-01  1084  static void __propagate_weights(struct ioc_gq *iocg, u32 active, u32 inuse,
b0853ab4a238c5 Tejun Heo   2020-09-01  1085  				bool save, struct ioc_now *now)
7caa47151ab2e6 Tejun Heo   2019-08-28  1086  {
7caa47151ab2e6 Tejun Heo   2019-08-28  1087  	struct ioc *ioc = iocg->ioc;
7caa47151ab2e6 Tejun Heo   2019-08-28  1088  	int lvl;
7caa47151ab2e6 Tejun Heo   2019-08-28  1089  
7caa47151ab2e6 Tejun Heo   2019-08-28  1090  	lockdep_assert_held(&ioc->lock);
7caa47151ab2e6 Tejun Heo   2019-08-28  1091  
e9f4eee9a0023b Tejun Heo   2021-05-11  1092  	/*
e9f4eee9a0023b Tejun Heo   2021-05-11  1093  	 * For an active leaf node, its inuse shouldn't be zero or exceed
e9f4eee9a0023b Tejun Heo   2021-05-11  1094  	 * @active. An active internal node's inuse is solely determined by the
e9f4eee9a0023b Tejun Heo   2021-05-11  1095  	 * inuse to active ratio of its children regardless of @inuse.
e9f4eee9a0023b Tejun Heo   2021-05-11  1096  	 */
e9f4eee9a0023b Tejun Heo   2021-05-11  1097  	if (list_empty(&iocg->active_list) && iocg->child_active_sum) {
e9f4eee9a0023b Tejun Heo   2021-05-11  1098  		inuse = DIV64_U64_ROUND_UP(active * iocg->child_inuse_sum,
e9f4eee9a0023b Tejun Heo   2021-05-11  1099  					   iocg->child_active_sum);
e9f4eee9a0023b Tejun Heo   2021-05-11  1100  	} else {
db84a72af6be42 Tejun Heo   2020-09-01 @1101  		inuse = clamp_t(u32, inuse, 1, active);
e9f4eee9a0023b Tejun Heo   2021-05-11  1102  	}
db84a72af6be42 Tejun Heo   2020-09-01  1103  
b0853ab4a238c5 Tejun Heo   2020-09-01  1104  	iocg->last_inuse = iocg->inuse;
b0853ab4a238c5 Tejun Heo   2020-09-01  1105  	if (save)
b0853ab4a238c5 Tejun Heo   2020-09-01  1106  		iocg->saved_margin = now->vnow - atomic64_read(&iocg->vtime);
b0853ab4a238c5 Tejun Heo   2020-09-01  1107  
db84a72af6be42 Tejun Heo   2020-09-01  1108  	if (active == iocg->active && inuse == iocg->inuse)
db84a72af6be42 Tejun Heo   2020-09-01  1109  		return;
7caa47151ab2e6 Tejun Heo   2019-08-28  1110  
7caa47151ab2e6 Tejun Heo   2019-08-28  1111  	for (lvl = iocg->level - 1; lvl >= 0; lvl--) {
7caa47151ab2e6 Tejun Heo   2019-08-28  1112  		struct ioc_gq *parent = iocg->ancestors[lvl];
7caa47151ab2e6 Tejun Heo   2019-08-28  1113  		struct ioc_gq *child = iocg->ancestors[lvl + 1];
7caa47151ab2e6 Tejun Heo   2019-08-28  1114  		u32 parent_active = 0, parent_inuse = 0;
7caa47151ab2e6 Tejun Heo   2019-08-28  1115  
7caa47151ab2e6 Tejun Heo   2019-08-28  1116  		/* update the level sums */
7caa47151ab2e6 Tejun Heo   2019-08-28  1117  		parent->child_active_sum += (s32)(active - child->active);
7caa47151ab2e6 Tejun Heo   2019-08-28  1118  		parent->child_inuse_sum += (s32)(inuse - child->inuse);
e9f4eee9a0023b Tejun Heo   2021-05-11  1119  		/* apply the updates */
7caa47151ab2e6 Tejun Heo   2019-08-28  1120  		child->active = active;
7caa47151ab2e6 Tejun Heo   2019-08-28  1121  		child->inuse = inuse;
7caa47151ab2e6 Tejun Heo   2019-08-28  1122  
7caa47151ab2e6 Tejun Heo   2019-08-28  1123  		/*
7caa47151ab2e6 Tejun Heo   2019-08-28  1124  		 * The delta between inuse and active sums indicates that
5ba1add216fe82 Baolin Wang 2020-11-26  1125  		 * much of weight is being given away.  Parent's inuse
7caa47151ab2e6 Tejun Heo   2019-08-28  1126  		 * and active should reflect the ratio.
7caa47151ab2e6 Tejun Heo   2019-08-28  1127  		 */
7caa47151ab2e6 Tejun Heo   2019-08-28  1128  		if (parent->child_active_sum) {
7caa47151ab2e6 Tejun Heo   2019-08-28  1129  			parent_active = parent->weight;
7caa47151ab2e6 Tejun Heo   2019-08-28  1130  			parent_inuse = DIV64_U64_ROUND_UP(
7caa47151ab2e6 Tejun Heo   2019-08-28  1131  				parent_active * parent->child_inuse_sum,
7caa47151ab2e6 Tejun Heo   2019-08-28  1132  				parent->child_active_sum);
7caa47151ab2e6 Tejun Heo   2019-08-28  1133  		}
7caa47151ab2e6 Tejun Heo   2019-08-28  1134  
7caa47151ab2e6 Tejun Heo   2019-08-28  1135  		/* do we need to keep walking up? */
7caa47151ab2e6 Tejun Heo   2019-08-28  1136  		if (parent_active == parent->active &&
7caa47151ab2e6 Tejun Heo   2019-08-28  1137  		    parent_inuse == parent->inuse)
7caa47151ab2e6 Tejun Heo   2019-08-28  1138  			break;
7caa47151ab2e6 Tejun Heo   2019-08-28  1139  
7caa47151ab2e6 Tejun Heo   2019-08-28  1140  		active = parent_active;
7caa47151ab2e6 Tejun Heo   2019-08-28  1141  		inuse = parent_inuse;
7caa47151ab2e6 Tejun Heo   2019-08-28  1142  	}
7caa47151ab2e6 Tejun Heo   2019-08-28  1143  
7caa47151ab2e6 Tejun Heo   2019-08-28  1144  	ioc->weights_updated = true;
7caa47151ab2e6 Tejun Heo   2019-08-28  1145  }
7caa47151ab2e6 Tejun Heo   2019-08-28  1146  

:::::: The code at line 1101 was first introduced by commit
:::::: db84a72af6be422abf2089a5896293590dda5066 blk-iocost: clamp inuse and skip noops in __propagate_weights()

:::::: TO: Tejun Heo <tj@kernel.org>
:::::: CC: Jens Axboe <axboe@kernel.dk>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
