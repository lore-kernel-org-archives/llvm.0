Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20B534A0A;
	Sat, 23 Nov 2024 07:20:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732346423; cv=none; b=FA4n6sT4RhsvMix+F4V9OX6drJuo/28RYLaKhd65GoWsCto9QKkwpytUPUd6Qz501691N8jyA7hIc0RkTLT2E3ANU7ZOqDaQPovwmBkmX/NSf42qMehyEgQPDsm3NXYCv/xznAmap1jZtdvYDAxkwpcJkN4CLwb/8/dNNpCxgTY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732346423; c=relaxed/simple;
	bh=h99ug78CQJLCQoIlVf6Bqxdxdxa/wrZrqWfi12PfGLU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Nx3MRdskEeATP1UExFqYv4oepIERktIKtHrhH39Xn/rfSIN9ufELFCXd3zr30Ff7tDT6s6ukPH5xLCdZJlUqYzqwhVfFUK9kUDGrUuNxcxKvFQWcHkP4YG2/O3LlD7SsSWlqNRNjq/6hS/Qzw8A/275P/DXk7T3NZaj2JdMnWp8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VLMM/d2Y; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VLMM/d2Y"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1732346421; x=1763882421;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=h99ug78CQJLCQoIlVf6Bqxdxdxa/wrZrqWfi12PfGLU=;
  b=VLMM/d2YX4U09LpBiv+Kcy/uXOuiYs0+vU9ZqlViNhXnULco5fWvrIhE
   NulNcPMThIFAN0ZoAKWAGLaAfLiS8GTFl0kwr3FXuJPVwgEf4RbDiGWxZ
   OCzhF3fVg4y+wxlU9AS4Q4+QodpSUgeTMApr1CzC94DWLJYBaWwSkBG8Y
   BpZYrSZsgOaaJbvZrNVROrPQFzfklznpD/ct97fPwxCVBBs/JcshLa2pq
   wQ5Rs/P02/qW8OnbWSbQxMhwEBU9CZ19yGpDk6k/SCK47B3g97QDAqsmU
   tTrli1rmnCKFLJCq+lOfnHhkA48JJj7xU/1Byg1GuwQAvK6xpkF1/NHQ3
   w==;
X-CSE-ConnectionGUID: dtgBD30vQHSfuQpa1wXZpA==
X-CSE-MsgGUID: I2/wYm4JTu+SHkGVOxnF+w==
X-IronPort-AV: E=McAfee;i="6700,10204,11264"; a="32437045"
X-IronPort-AV: E=Sophos;i="6.12,178,1728975600"; 
   d="scan'208";a="32437045"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Nov 2024 23:20:20 -0800
X-CSE-ConnectionGUID: S+wstj37Q4eIJMf7/eo+HQ==
X-CSE-MsgGUID: tbl+DRZaRKCdMWWx8yp/5w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,178,1728975600"; 
   d="scan'208";a="91575367"
Received: from lkp-server01.sh.intel.com (HELO 8122d2fc1967) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 22 Nov 2024 23:20:20 -0800
Received: from kbuild by 8122d2fc1967 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tEkRF-0004Uj-0k;
	Sat, 23 Nov 2024 07:20:17 +0000
Date: Sat, 23 Nov 2024 15:20:07 +0800
From: kernel test robot <lkp@intel.com>
To: SeongJae Park <sj@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [sj:damon/next 12/59] samples/damon/prcl.c:86:22: warning: implicit
 conversion from 'unsigned long' to 'unsigned int' changes value from
 18446744073709551615 to 4294967295
Message-ID: <202411231754.4u5u1Nwv-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/sj/linux.git damon/next
head:   78907e9aaa2afc17557ccada5eeafa2f4423ddcc
commit: 6a0ed0a7aac349150628bda45521200cb75006c2 [12/59] samples/damon/prcl: implement schemes setup
config: s390-allmodconfig (https://download.01.org/0day-ci/archive/20241123/202411231754.4u5u1Nwv-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project 592c0fe55f6d9a811028b5f3507be91458ab2713)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241123/202411231754.4u5u1Nwv-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411231754.4u5u1Nwv-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from samples/damon/prcl.c:9:
   In file included from include/linux/damon.h:11:
   In file included from include/linux/memcontrol.h:21:
   In file included from include/linux/mm.h:2211:
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
>> samples/damon/prcl.c:86:22: warning: implicit conversion from 'unsigned long' to 'unsigned int' changes value from 18446744073709551615 to 4294967295 [-Wconstant-conversion]
      80 |                         &(struct damos_access_pattern) {
         |                                                        ~
      81 |                         .min_sz_region = PAGE_SIZE,
      82 |                         .max_sz_region = ULONG_MAX,
      83 |                         .min_nr_accesses = 0,
      84 |                         .max_nr_accesses = 0,
      85 |                         .min_age_region = 50,
      86 |                         .max_age_region = ULONG_MAX},
         |                                           ^~~~~~~~~
   include/vdso/limits.h:13:20: note: expanded from macro 'ULONG_MAX'
      13 | #define ULONG_MAX       (~0UL)
         |                          ^~~~
   5 warnings generated.


vim +86 samples/damon/prcl.c

    48	
    49	static int damon_sample_prcl_start(void)
    50	{
    51		struct damon_target *target;
    52		struct damos *scheme;
    53	
    54		pr_info("start\n");
    55	
    56		ctx = damon_new_ctx();
    57		if (!ctx)
    58			return -ENOMEM;
    59		if (damon_select_ops(ctx, DAMON_OPS_VADDR)) {
    60			damon_destroy_ctx(ctx);
    61			return -EINVAL;
    62		}
    63	
    64		target = damon_new_target();
    65		if (!target) {
    66			damon_destroy_ctx(ctx);
    67			return -ENOMEM;
    68		}
    69		damon_add_target(ctx, target);
    70		target_pidp = find_get_pid(target_pid);
    71		if (!target_pidp) {
    72			damon_destroy_ctx(ctx);
    73			return -EINVAL;
    74		}
    75		target->pid = target_pidp;
    76	
    77		ctx->callback.after_aggregation = damon_sample_prcl_after_aggregate;
    78	
    79		scheme = damon_new_scheme(
    80				&(struct damos_access_pattern) {
    81				.min_sz_region = PAGE_SIZE,
    82				.max_sz_region = ULONG_MAX,
    83				.min_nr_accesses = 0,
    84				.max_nr_accesses = 0,
    85				.min_age_region = 50,
  > 86				.max_age_region = ULONG_MAX},
    87				DAMOS_PAGEOUT,
    88				0,
    89				&(struct damos_quota){},
    90				&(struct damos_watermarks){},
    91				NUMA_NO_NODE);
    92		if (!scheme) {
    93			damon_destroy_ctx(ctx);
    94			return -ENOMEM;
    95		}
    96		damon_set_schemes(ctx, &scheme, 1);
    97	
    98		return damon_start(&ctx, 1, true);
    99	}
   100	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
