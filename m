Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 744551C245C;
	Wed, 11 Dec 2024 19:35:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733945747; cv=none; b=CcZzwzOtOpG60Y9qWE/j7mc3cKkFBN+5QwBuWSG0YdxLfwfIqcNG8yxx1PphNUnvJ28cLo0TR9/19NUXiGN2HZAceoMc8jotIRk9/dExIpzoNpCGIe4WheWgX+srBtQU33xjJrxjVLAgL9Ygle1l4UXMGEk0kYswn3FBCeOVlvk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733945747; c=relaxed/simple;
	bh=rAWTaFvq5MIpa9rJe2/Ev2vblQZ6ykreEvwH2RKsHEA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Hdn09+BHY8Zd66VD1JXAr4ASEhd6zsg/QAFlHCw4rCrs7Z3Sk21BB26ectadDOg00vr0fB4e1VWYb0aWwQTslOUc3aJUT0eDldTz5Vkc5O7HSTmVHGIdgl2466/AApYiP17ONjOPrBPHB4RainoMaShfCu6ngRMnb2RG9GNEhQU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WsST7ebq; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WsST7ebq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1733945745; x=1765481745;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=rAWTaFvq5MIpa9rJe2/Ev2vblQZ6ykreEvwH2RKsHEA=;
  b=WsST7ebqIC82CjUNh82mtqH255c3pRzdXP7/ADyhcZcH/CJEv4x6MdS7
   EFVT5RQn9egI3hEg1QTmmvYfWbSeCH4lEJJIUr7TQIn5E/XhSR2Tk1VRy
   Nb+3wzlyGPCTcW21YpreMZaw0wavABbEOuPebTQ8EAbQl8Tk+FJZFl5O1
   4WoKCNRe8UErYZbyPX9VT7/q7/XLeZ//GUOtYPLk/7edSXuYW8pAc/QYq
   BeUWNejJ2Ii6YGOAqR0SlHro/PWvpFjtn7u0Tr4dHdg68zgkrHwviAw4k
   xAouycxspSAnkzNwzh4DfFbOQmpWSv4ZTqJkw/hzJGG2fWuI8oG/FTC+N
   Q==;
X-CSE-ConnectionGUID: uSaGBd4lRN6sM8f5iBdbLg==
X-CSE-MsgGUID: H3xfVvKJT5GsUygabGS5CA==
X-IronPort-AV: E=McAfee;i="6700,10204,11283"; a="34471959"
X-IronPort-AV: E=Sophos;i="6.12,226,1728975600"; 
   d="scan'208";a="34471959"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Dec 2024 11:35:45 -0800
X-CSE-ConnectionGUID: E5lzs75VQjenbl16v6Cmyg==
X-CSE-MsgGUID: g6VEbvrkTai79NfI9ODwVQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="100999199"
Received: from lkp-server01.sh.intel.com (HELO 82a3f569d0cb) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 11 Dec 2024 11:35:43 -0800
Received: from kbuild by 82a3f569d0cb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tLSUm-00071s-3D;
	Wed, 11 Dec 2024 19:35:40 +0000
Date: Thu, 12 Dec 2024 03:35:04 +0800
From: kernel test robot <lkp@intel.com>
To: David Laight <David.Laight@aculab.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Andrew Morton <akpm@linux-foundation.org>,
	Linux Memory Management List <linux-mm@kvack.org>
Subject: [linux-next:master 1948/2656] block/blk-iocost.c:1101:11: error:
 call to __compiletime_assert_560 declared with 'error' attribute: clamp()
 low limit 1 greater than high limit active
Message-ID: <202412120322.3GfVe3vF-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   91e71d606356e50f238d7a87aacdee4abc427f07
commit: 212fe932ee57ec4a0f41bdc42b58c64fe3062147 [1948/2656] minmax.h: simplify the variants of clamp()
config: s390-defconfig (https://download.01.org/0day-ci/archive/20241212/202412120322.3GfVe3vF-lkp@intel.com/config)
compiler: clang version 15.0.7 (https://github.com/llvm/llvm-project 8dfdcc7b7bf66834a761bd8de445840ef68e4d1a)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241212/202412120322.3GfVe3vF-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412120322.3GfVe3vF-lkp@intel.com/

All errors (new ones prefixed by >>):

>> block/blk-iocost.c:1101:11: error: call to __compiletime_assert_560 declared with 'error' attribute: clamp() low limit 1 greater than high limit active
                   inuse = clamp_t(u32, inuse, 1, active);
                           ^
   include/linux/minmax.h:220:36: note: expanded from macro 'clamp_t'
   #define clamp_t(type, val, lo, hi) __careful_clamp(type, val, lo, hi)
                                      ^
   include/linux/minmax.h:197:2: note: expanded from macro '__careful_clamp'
           __clamp_once(type, val, lo, hi, __UNIQUE_ID(v_), __UNIQUE_ID(l_), __UNIQUE_ID(h_))
           ^
   include/linux/minmax.h:190:2: note: expanded from macro '__clamp_once'
           BUILD_BUG_ON_MSG(statically_true(ulo > uhi),                            \
           ^
   note: (skipping 2 expansions in backtrace; use -fmacro-backtrace-limit=0 to see all)
   include/linux/compiler_types.h:530:2: note: expanded from macro '_compiletime_assert'
           __compiletime_assert(condition, msg, prefix, suffix)
           ^
   include/linux/compiler_types.h:523:4: note: expanded from macro '__compiletime_assert'
                           prefix ## suffix();                             \
                           ^
   <scratch space>:24:1: note: expanded from here
   __compiletime_assert_560
   ^
>> block/blk-iocost.c:1101:11: error: call to __compiletime_assert_560 declared with 'error' attribute: clamp() low limit 1 greater than high limit active
   include/linux/minmax.h:220:36: note: expanded from macro 'clamp_t'
   #define clamp_t(type, val, lo, hi) __careful_clamp(type, val, lo, hi)
                                      ^
   include/linux/minmax.h:197:2: note: expanded from macro '__careful_clamp'
           __clamp_once(type, val, lo, hi, __UNIQUE_ID(v_), __UNIQUE_ID(l_), __UNIQUE_ID(h_))
           ^
   include/linux/minmax.h:190:2: note: expanded from macro '__clamp_once'
           BUILD_BUG_ON_MSG(statically_true(ulo > uhi),                            \
           ^
   note: (skipping 2 expansions in backtrace; use -fmacro-backtrace-limit=0 to see all)
   include/linux/compiler_types.h:530:2: note: expanded from macro '_compiletime_assert'
           __compiletime_assert(condition, msg, prefix, suffix)
           ^
   include/linux/compiler_types.h:523:4: note: expanded from macro '__compiletime_assert'
                           prefix ## suffix();                             \
                           ^
   <scratch space>:24:1: note: expanded from here
   __compiletime_assert_560
   ^
   2 errors generated.


vim +/error +1101 block/blk-iocost.c

7caa47151ab2e64 Tejun Heo   2019-08-28  1078  
7caa47151ab2e64 Tejun Heo   2019-08-28  1079  /*
7caa47151ab2e64 Tejun Heo   2019-08-28  1080   * Update @iocg's `active` and `inuse` to @active and @inuse, update level
b0853ab4a238c54 Tejun Heo   2020-09-01  1081   * weight sums and propagate upwards accordingly. If @save, the current margin
b0853ab4a238c54 Tejun Heo   2020-09-01  1082   * is saved to be used as reference for later inuse in-period adjustments.
7caa47151ab2e64 Tejun Heo   2019-08-28  1083   */
b0853ab4a238c54 Tejun Heo   2020-09-01  1084  static void __propagate_weights(struct ioc_gq *iocg, u32 active, u32 inuse,
b0853ab4a238c54 Tejun Heo   2020-09-01  1085  				bool save, struct ioc_now *now)
7caa47151ab2e64 Tejun Heo   2019-08-28  1086  {
7caa47151ab2e64 Tejun Heo   2019-08-28  1087  	struct ioc *ioc = iocg->ioc;
7caa47151ab2e64 Tejun Heo   2019-08-28  1088  	int lvl;
7caa47151ab2e64 Tejun Heo   2019-08-28  1089  
7caa47151ab2e64 Tejun Heo   2019-08-28  1090  	lockdep_assert_held(&ioc->lock);
7caa47151ab2e64 Tejun Heo   2019-08-28  1091  
e9f4eee9a0023ba Tejun Heo   2021-05-11  1092  	/*
e9f4eee9a0023ba Tejun Heo   2021-05-11  1093  	 * For an active leaf node, its inuse shouldn't be zero or exceed
e9f4eee9a0023ba Tejun Heo   2021-05-11  1094  	 * @active. An active internal node's inuse is solely determined by the
e9f4eee9a0023ba Tejun Heo   2021-05-11  1095  	 * inuse to active ratio of its children regardless of @inuse.
e9f4eee9a0023ba Tejun Heo   2021-05-11  1096  	 */
e9f4eee9a0023ba Tejun Heo   2021-05-11  1097  	if (list_empty(&iocg->active_list) && iocg->child_active_sum) {
e9f4eee9a0023ba Tejun Heo   2021-05-11  1098  		inuse = DIV64_U64_ROUND_UP(active * iocg->child_inuse_sum,
e9f4eee9a0023ba Tejun Heo   2021-05-11  1099  					   iocg->child_active_sum);
e9f4eee9a0023ba Tejun Heo   2021-05-11  1100  	} else {
db84a72af6be422 Tejun Heo   2020-09-01 @1101  		inuse = clamp_t(u32, inuse, 1, active);
e9f4eee9a0023ba Tejun Heo   2021-05-11  1102  	}
db84a72af6be422 Tejun Heo   2020-09-01  1103  
b0853ab4a238c54 Tejun Heo   2020-09-01  1104  	iocg->last_inuse = iocg->inuse;
b0853ab4a238c54 Tejun Heo   2020-09-01  1105  	if (save)
b0853ab4a238c54 Tejun Heo   2020-09-01  1106  		iocg->saved_margin = now->vnow - atomic64_read(&iocg->vtime);
b0853ab4a238c54 Tejun Heo   2020-09-01  1107  
db84a72af6be422 Tejun Heo   2020-09-01  1108  	if (active == iocg->active && inuse == iocg->inuse)
db84a72af6be422 Tejun Heo   2020-09-01  1109  		return;
7caa47151ab2e64 Tejun Heo   2019-08-28  1110  
7caa47151ab2e64 Tejun Heo   2019-08-28  1111  	for (lvl = iocg->level - 1; lvl >= 0; lvl--) {
7caa47151ab2e64 Tejun Heo   2019-08-28  1112  		struct ioc_gq *parent = iocg->ancestors[lvl];
7caa47151ab2e64 Tejun Heo   2019-08-28  1113  		struct ioc_gq *child = iocg->ancestors[lvl + 1];
7caa47151ab2e64 Tejun Heo   2019-08-28  1114  		u32 parent_active = 0, parent_inuse = 0;
7caa47151ab2e64 Tejun Heo   2019-08-28  1115  
7caa47151ab2e64 Tejun Heo   2019-08-28  1116  		/* update the level sums */
7caa47151ab2e64 Tejun Heo   2019-08-28  1117  		parent->child_active_sum += (s32)(active - child->active);
7caa47151ab2e64 Tejun Heo   2019-08-28  1118  		parent->child_inuse_sum += (s32)(inuse - child->inuse);
e9f4eee9a0023ba Tejun Heo   2021-05-11  1119  		/* apply the updates */
7caa47151ab2e64 Tejun Heo   2019-08-28  1120  		child->active = active;
7caa47151ab2e64 Tejun Heo   2019-08-28  1121  		child->inuse = inuse;
7caa47151ab2e64 Tejun Heo   2019-08-28  1122  
7caa47151ab2e64 Tejun Heo   2019-08-28  1123  		/*
7caa47151ab2e64 Tejun Heo   2019-08-28  1124  		 * The delta between inuse and active sums indicates that
5ba1add216fe822 Baolin Wang 2020-11-26  1125  		 * much of weight is being given away.  Parent's inuse
7caa47151ab2e64 Tejun Heo   2019-08-28  1126  		 * and active should reflect the ratio.
7caa47151ab2e64 Tejun Heo   2019-08-28  1127  		 */
7caa47151ab2e64 Tejun Heo   2019-08-28  1128  		if (parent->child_active_sum) {
7caa47151ab2e64 Tejun Heo   2019-08-28  1129  			parent_active = parent->weight;
7caa47151ab2e64 Tejun Heo   2019-08-28  1130  			parent_inuse = DIV64_U64_ROUND_UP(
7caa47151ab2e64 Tejun Heo   2019-08-28  1131  				parent_active * parent->child_inuse_sum,
7caa47151ab2e64 Tejun Heo   2019-08-28  1132  				parent->child_active_sum);
7caa47151ab2e64 Tejun Heo   2019-08-28  1133  		}
7caa47151ab2e64 Tejun Heo   2019-08-28  1134  
7caa47151ab2e64 Tejun Heo   2019-08-28  1135  		/* do we need to keep walking up? */
7caa47151ab2e64 Tejun Heo   2019-08-28  1136  		if (parent_active == parent->active &&
7caa47151ab2e64 Tejun Heo   2019-08-28  1137  		    parent_inuse == parent->inuse)
7caa47151ab2e64 Tejun Heo   2019-08-28  1138  			break;
7caa47151ab2e64 Tejun Heo   2019-08-28  1139  
7caa47151ab2e64 Tejun Heo   2019-08-28  1140  		active = parent_active;
7caa47151ab2e64 Tejun Heo   2019-08-28  1141  		inuse = parent_inuse;
7caa47151ab2e64 Tejun Heo   2019-08-28  1142  	}
7caa47151ab2e64 Tejun Heo   2019-08-28  1143  
7caa47151ab2e64 Tejun Heo   2019-08-28  1144  	ioc->weights_updated = true;
7caa47151ab2e64 Tejun Heo   2019-08-28  1145  }
7caa47151ab2e64 Tejun Heo   2019-08-28  1146  

:::::: The code at line 1101 was first introduced by commit
:::::: db84a72af6be422abf2089a5896293590dda5066 blk-iocost: clamp inuse and skip noops in __propagate_weights()

:::::: TO: Tejun Heo <tj@kernel.org>
:::::: CC: Jens Axboe <axboe@kernel.dk>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
