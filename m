Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37DAF80B;
	Tue, 14 May 2024 00:43:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715647387; cv=none; b=SIFBOjM7vz1kEzgHUOXjbpVxg2saHBRPD+7dmhZuIC99nImvOQrc06M/N4wGr8aAdAI64QJNdjHjj0CmQHuDNURKDa1YrTiuI4YaH6EF3FoqmqBWKKNbsEYaxVdmDMxIbtqZ12wVn+jPqBAUBaXgdHWCbnkhlI65l5Erk3jXEWE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715647387; c=relaxed/simple;
	bh=ZryIIbiVDYWRQn7t/G3yRRHGREVeqHYpWMyolF6HQ08=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=U92Ar9LLpZTya2UqiS305HHMWcZSinqMaiH1PdV5FnuHvoXarP3lyOm3IVBc1tgTwb9I0cCD9QKDOfG9uC401yjF5DK/gkB/9G36KlsW10ewC6vVd96YpbQVLrdw73Z3rVxJg9n+er5UPIDQR67bLh33d+++Eb1xo45QQAA0aRk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mcK6dbzD; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mcK6dbzD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1715647385; x=1747183385;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ZryIIbiVDYWRQn7t/G3yRRHGREVeqHYpWMyolF6HQ08=;
  b=mcK6dbzDK+f48jusIhD91RbhUFn1nodz6IYTfByIY+Ad/JRqXgzZhCSr
   DN9d7e+7FCifEl74/v6OXICWt8wO3dJiDBKCQb5JTVIgNeQ8fZjmFsGss
   NYGg/ICYZMdmEXBboBBnXB8OkrZMP6lqTY7556cqm4ZAQJDOQVMrciGyt
   2bxozq/CXIwdjv1H/Dv5dieqB0waKzl6UFqNw4aRA5mCR7ibcYxyL5/XO
   eM4cleqgBJdPJw2jOXwEonZMyaxyenHwCexL/hNpaG9u1BJk5OnaTnTLt
   7bmUxxHpCSISc0vRTXZla5qDFWwqRW3CfkuJrdbHaVCKueYDFlH8KRNqR
   Q==;
X-CSE-ConnectionGUID: Os4KpTFCQoi8ecBnIqcdAA==
X-CSE-MsgGUID: qlR2/dc0QGiAw2tvMBjwIw==
X-IronPort-AV: E=McAfee;i="6600,9927,11072"; a="11481255"
X-IronPort-AV: E=Sophos;i="6.08,159,1712646000"; 
   d="scan'208";a="11481255"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 May 2024 17:43:04 -0700
X-CSE-ConnectionGUID: p0VVmWtKSHaq2NFdWObgOA==
X-CSE-MsgGUID: TUASN2n5RyePyx7Fx0ijVg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,159,1712646000"; 
   d="scan'208";a="30510773"
Received: from lkp-server01.sh.intel.com (HELO f8b243fe6e68) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 13 May 2024 17:43:03 -0700
Received: from kbuild by f8b243fe6e68 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s6gFw-000ApX-20;
	Tue, 14 May 2024 00:43:00 +0000
Date: Tue, 14 May 2024 08:42:49 +0800
From: kernel test robot <lkp@intel.com>
To: SeongJae Park <sj@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [sj:damon/next 31/33] mm/damon/acma.c:55:14: error: use of
 undeclared identifier 'min_mem'
Message-ID: <202405140818.yufjVMoG-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/sj/linux.git damon/next
head:   8babfaa14bfc8f45e2c3d093952ab737fd0db1d5
commit: 9e366602d1dd2158af19792fb7f53364545b60a1 [31/33] mm/damon/acma: implement scale down feature
config: hexagon-allmodconfig (https://download.01.org/0day-ci/archive/20240514/202405140818.yufjVMoG-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project b910bebc300dafb30569cecc3017b446ea8eafa0)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240514/202405140818.yufjVMoG-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202405140818.yufjVMoG-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from mm/damon/acma.c:16:
   In file included from include/linux/damon.h:11:
   In file included from include/linux/memcontrol.h:13:
   In file included from include/linux/cgroup.h:26:
   In file included from include/linux/kernel_stat.h:9:
   In file included from include/linux/interrupt.h:11:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/hexagon/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:14:
   In file included from arch/hexagon/include/asm/io.h:328:
   include/asm-generic/io.h:548:31: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     548 |         val = __raw_readb(PCI_IOBASE + addr);
         |                           ~~~~~~~~~~ ^
   include/asm-generic/io.h:561:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     561 |         val = __le16_to_cpu((__le16 __force)__raw_readw(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:37:51: note: expanded from macro '__le16_to_cpu'
      37 | #define __le16_to_cpu(x) ((__force __u16)(__le16)(x))
         |                                                   ^
   In file included from mm/damon/acma.c:16:
   In file included from include/linux/damon.h:11:
   In file included from include/linux/memcontrol.h:13:
   In file included from include/linux/cgroup.h:26:
   In file included from include/linux/kernel_stat.h:9:
   In file included from include/linux/interrupt.h:11:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/hexagon/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:14:
   In file included from arch/hexagon/include/asm/io.h:328:
   include/asm-generic/io.h:574:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     574 |         val = __le32_to_cpu((__le32 __force)__raw_readl(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:35:51: note: expanded from macro '__le32_to_cpu'
      35 | #define __le32_to_cpu(x) ((__force __u32)(__le32)(x))
         |                                                   ^
   In file included from mm/damon/acma.c:16:
   In file included from include/linux/damon.h:11:
   In file included from include/linux/memcontrol.h:13:
   In file included from include/linux/cgroup.h:26:
   In file included from include/linux/kernel_stat.h:9:
   In file included from include/linux/interrupt.h:11:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/hexagon/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:14:
   In file included from arch/hexagon/include/asm/io.h:328:
   include/asm-generic/io.h:585:33: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     585 |         __raw_writeb(value, PCI_IOBASE + addr);
         |                             ~~~~~~~~~~ ^
   include/asm-generic/io.h:595:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     595 |         __raw_writew((u16 __force)cpu_to_le16(value), PCI_IOBASE + addr);
         |                                                       ~~~~~~~~~~ ^
   include/asm-generic/io.h:605:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     605 |         __raw_writel((u32 __force)cpu_to_le32(value), PCI_IOBASE + addr);
         |                                                       ~~~~~~~~~~ ^
   In file included from mm/damon/acma.c:16:
   In file included from include/linux/damon.h:11:
   In file included from include/linux/memcontrol.h:21:
   In file included from include/linux/mm.h:2253:
   include/linux/vmstat.h:514:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     514 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
>> mm/damon/acma.c:55:14: error: use of undeclared identifier 'min_mem'
      55 | module_param(min_mem, ulong, 0600);
         |              ^
>> mm/damon/acma.c:55:14: error: use of undeclared identifier 'min_mem'
   mm/damon/acma.c:178:22: error: too few arguments to function call, expected 6, have 5
     170 |         return damon_new_scheme(
         |                ~~~~~~~~~~~~~~~~
     171 |                         pattern,
     172 |                         action,
     173 |                         /* work for every second */
     174 |                         1000000,
     175 |                         /* under the quota. */
     176 |                         &quota,
     177 |                         /* (De)activate this according to the watermarks. */
     178 |                         &damon_acma_wmarks);
         |                                           ^
   include/linux/damon.h:770:15: note: 'damon_new_scheme' declared here
     770 | struct damos *damon_new_scheme(struct damos_access_pattern *pattern,
         |               ^                ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     771 |                         enum damos_action action,
         |                         ~~~~~~~~~~~~~~~~~~~~~~~~~
     772 |                         unsigned long apply_interval_us,
         |                         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     773 |                         struct damos_quota *quota,
         |                         ~~~~~~~~~~~~~~~~~~~~~~~~~~
     774 |                         struct damos_watermarks *wmarks,
         |                         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     775 |                         int target_nid);
         |                         ~~~~~~~~~~~~~~
   mm/damon/acma.c:193:3: error: must use 'enum' tag to refer to type 'damos_quota_goal_metric'
     193 |                 damos_quota_goal_metric goal_metric)
         |                 ^
         |                 enum 
   mm/damon/acma.c:197:2: error: use of undeclared identifier 'goal'
     197 |         goal = damos_new_quota_goal(goal_metric, quota_mem_pressure_us);
         |         ^
   mm/damon/acma.c:198:7: error: use of undeclared identifier 'goal'
     198 |         if (!goal)
         |              ^
   mm/damon/acma.c:200:39: error: use of undeclared identifier 'goal'
     200 |         damos_add_quota_goal(&scheme->quota, goal);
         |                                              ^
>> mm/damon/acma.c:233:52: error: use of undeclared identifier 'KB'
     233 |         start_limit = monitor_region_start + min_mem_kb * KB;
         |                                                           ^
>> mm/damon/acma.c:236:45: error: use of undeclared identifier 'MB'
     236 |         for (end = end_limit; end >= start_limit + SCALE_WINDOW;
         |                                                    ^
   mm/damon/acma.c:208:29: note: expanded from macro 'SCALE_WINDOW'
     208 | #define SCALE_WINDOW    (128 * MB)
         |                                ^
   mm/damon/acma.c:237:11: error: use of undeclared identifier 'MB'
     237 |                         end -= SCALE_WINDOW) {
         |                                ^
   mm/damon/acma.c:208:29: note: expanded from macro 'SCALE_WINDOW'
     208 | #define SCALE_WINDOW    (128 * MB)
         |                                ^
>> mm/damon/acma.c:238:7: error: call to undeclared function 'damon_alloced_bytes'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     238 |                 if (damon_alloced_bytes(end, end - SCALE_WINDOW)
         |                     ^
   mm/damon/acma.c:238:38: error: use of undeclared identifier 'MB'
     238 |                 if (damon_alloced_bytes(end, end - SCALE_WINDOW)
         |                                                    ^
   mm/damon/acma.c:208:29: note: expanded from macro 'SCALE_WINDOW'
     208 | #define SCALE_WINDOW    (128 * MB)
         |                                ^
   mm/damon/acma.c:239:8: error: use of undeclared identifier 'MB'
     239 |                                 != SCALE_WINDOW)
         |                                    ^
   mm/damon/acma.c:208:29: note: expanded from macro 'SCALE_WINDOW'
     208 | #define SCALE_WINDOW    (128 * MB)
         |                                ^
   mm/damon/acma.c:242:52: error: use of undeclared identifier 'MB'
     242 |         filter->addr_range.start = max(start_limit, end - SCALE_WINDOW);
         |                                                           ^
   mm/damon/acma.c:208:29: note: expanded from macro 'SCALE_WINDOW'
     208 | #define SCALE_WINDOW    (128 * MB)
         |                                ^
   mm/damon/acma.c:256:9: error: call to undeclared function 'page_report'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     256 |         return page_report(PHYS_PFN(addr), 1 << scale_pg_order);
         |                ^
   mm/damon/acma.c:256:30: error: use of undeclared identifier 'addr'
     256 |         return page_report(PHYS_PFN(addr), 1 << scale_pg_order);
         |                                     ^
   mm/damon/acma.c:290:43: error: use of undeclared identifier 'DAMOS_ALLOC'; did you mean 'DAMOS_COLD'?
     290 |         scheme = damon_acma_new_scheme(&pattern, DAMOS_ALLOC);
         |                                                  ^~~~~~~~~~~
         |                                                  DAMOS_COLD
   include/linux/damon.h:126:2: note: 'DAMOS_COLD' declared here
     126 |         DAMOS_COLD,
         |         ^
   mm/damon/acma.c:300:10: error: no member named 'alloc_order' in 'struct damos'
     300 |         scheme->alloc_order = scale_pg_order;
         |         ~~~~~~  ^
   mm/damon/acma.c:301:10: error: no member named 'alloc_callback' in 'struct damos'
     301 |         scheme->alloc_callback = damon_acma_alloc_callback;
         |         ~~~~~~  ^
   fatal error: too many errors emitted, stopping now [-ferror-limit=]
   7 warnings and 20 errors generated.


vim +/min_mem +55 mm/damon/acma.c

    49	
    50	/*
    51	 * Minimum amount of memory to be guaranteed to the system.  In other words,
    52	 * the lower limit of the scaling.
    53	 */
    54	static unsigned long min_mem_kb __read_mostly;
  > 55	module_param(min_mem, ulong, 0600);
    56	
    57	/*
    58	 * Desired level of memory pressure-stall time in microseconds.
    59	 *
    60	 * While keeping the caps that set by other quotas, DAMON_RECLAIM automatically
    61	 * increases and decreases the effective level of the quota aiming this level of
    62	 * memory pressure is incurred.  System-wide ``some`` memory PSI in microseconds
    63	 * per quota reset interval (``quota_reset_interval_ms``) is collected and
    64	 * compared to this value to see if the aim is satisfied.  Value zero means
    65	 * disabling this auto-tuning feature.
    66	 *
    67	 * 1 ms/ 1 second (0.1%) by default.  Inspired by the PSI threshold of TMO
    68	 * (https://dl.acm.org/doi/10.1145/3503222.3507731).
    69	 */
    70	static unsigned long quota_mem_pressure_us __read_mostly = 1000;
    71	module_param(quota_mem_pressure_us, ulong, 0600);
    72	
    73	/*
    74	 * Basic scale down/up granularity.  ACMA will allocate and report contiguous
    75	 * pages of this size at once.  512 pages (2 MiB for 4 KiB page setup) by
    76	 * default.
    77	 *
    78	 * To minimize DAMON-internal ALLOC-ed memory management overhead, we further
    79	 * apply SCALE_WINDOW.  Refer to damon_acma_set_scale_down_region_filter() for
    80	 * more detail about it.
    81	 */
    82	static unsigned int scale_pg_order __read_mostly = 9;
    83	module_param(scale_pg_order, uint, 0600);
    84	
    85	static struct damos_quota damon_acma_quota = {
    86		/* Use up to 15 ms per 1 sec for scaling, by default */
    87		.ms = 15,
    88		.sz = 0,
    89		.reset_interval = 1000,
    90		/* Within the quota, mark hotter regions accessed first. */
    91		.weight_sz = 0,
    92		.weight_nr_accesses = 1,
    93		.weight_age = 0,
    94	};
    95	DEFINE_DAMON_MODULES_DAMOS_TIME_QUOTA(damon_acma_quota);
    96	
    97	static struct damos_watermarks damon_acma_wmarks = {
    98		.metric = DAMOS_WMARK_NONE,
    99	};
   100	
   101	static struct damon_attrs damon_acma_mon_attrs = {
   102		.sample_interval = 1000000,	/* 1 second */
   103		.aggr_interval = 20000000,	/* 20 seconds */
   104		.ops_update_interval = 0,
   105		.min_nr_regions = 10,
   106		.max_nr_regions = 1000,
   107	};
   108	DEFINE_DAMON_MODULES_MON_ATTRS_PARAMS(damon_acma_mon_attrs);
   109	
   110	/*
   111	 * Start of the target memory region in physical address.
   112	 *
   113	 * The start physical address of memory region that DAMON_ACMA will do work
   114	 * against.  By default, biggest System RAM is used as the region.
   115	 */
   116	static unsigned long monitor_region_start __read_mostly;
   117	module_param(monitor_region_start, ulong, 0600);
   118	
   119	/*
   120	 * End of the target memory region in physical address.
   121	 *
   122	 * The end physical address of memory region that DAMON_ACMA will do work
   123	 * against.  By default, biggest System RAM is used as the region.
   124	 */
   125	static unsigned long monitor_region_end __read_mostly;
   126	module_param(monitor_region_end, ulong, 0600);
   127	
   128	/*
   129	 * PID of the DAMON thread
   130	 *
   131	 * If DAMON_ACMA is enabled, this becomes the PID of the worker thread.
   132	 * Else, -1.
   133	 */
   134	static int kdamond_pid __read_mostly = -1;
   135	module_param(kdamond_pid, int, 0400);
   136	
   137	static struct damos_stat damon_acma_reclaim_stat;
   138	DEFINE_DAMON_MODULES_DAMOS_STATS_PARAMS(damon_acma_reclaim_stat,
   139			acma_reclaim_tried_regions, acma_reclaim_succ_regions,
   140			acma_reclaim_quota_exceeds);
   141	
   142	static struct damos_stat damon_acma_scale_down_stat;
   143	DEFINE_DAMON_MODULES_DAMOS_STATS_PARAMS(damon_acma_scale_down_stat,
   144			acma_scale_down_tried_regions, acma_scale_down_succ_regions,
   145			acma_scale_down_quota_exceeds);
   146	
   147	static struct damos_access_pattern damon_acma_stub_pattern = {
   148		/* Find regions having PAGE_SIZE or larger size */
   149		.min_sz_region = PAGE_SIZE,
   150		.max_sz_region = ULONG_MAX,
   151		/* no matter its access frequency */
   152		.min_nr_accesses = 0,
   153		.max_nr_accesses = UINT_MAX,
   154		/* no matter its age */
   155		.min_age_region = 0,
   156		.max_age_region = UINT_MAX,
   157	};
   158	
   159	static struct damon_ctx *ctx;
   160	static struct damon_target *target;
   161	
   162	static struct damos *damon_acma_new_scheme(
   163			struct damos_access_pattern *pattern, enum damos_action action)
   164	{
   165		struct damos_quota quota = damon_acma_quota;
   166	
   167		/* Use 1/2 of total quota for hot/cold pages sorting */
   168		quota.ms = quota.ms / 2;
   169	
   170		return damon_new_scheme(
   171				pattern,
   172				action,
   173				/* work for every second */
   174				1000000,
   175				/* under the quota. */
   176				&quota,
   177				/* (De)activate this according to the watermarks. */
   178				&damon_acma_wmarks);
   179	}
   180	
   181	static void damon_acma_copy_quota_status(struct damos_quota *dst,
   182			struct damos_quota *src)
   183	{
   184		dst->total_charged_sz = src->total_charged_sz;
   185		dst->total_charged_ns = src->total_charged_ns;
   186		dst->charged_sz = src->charged_sz;
   187		dst->charged_from = src->charged_from;
   188		dst->charge_target_from = src->charge_target_from;
   189		dst->charge_addr_from = src->charge_addr_from;
   190	}
   191	
   192	static int damon_acma_set_scheme_quota(struct damos *scheme, struct damos *old,
   193			damos_quota_goal_metric goal_metric)
   194	{
   195		if (old)
   196			damon_acma_copy_quota_status(&scheme->quota, &old->quota);
   197		goal = damos_new_quota_goal(goal_metric, quota_mem_pressure_us);
   198		if (!goal)
   199			return -ENOMEM;
   200		damos_add_quota_goal(&scheme->quota, goal);
   201		return 0;
   202	}
   203	
   204	/*
   205	 * scale_pg_order is for basic scaling granularity.  Have a larger granularity
   206	 * to limit DAMON-internal alloc-ed pages management overhead.
   207	 */
   208	#define SCALE_WINDOW	(128 * MB)
   209	
   210	/*
   211	 * Set scale_down scheme's address range type filter to apply scaling down to
   212	 * only current scaling window.  Scaling window is SCALE_WINDOW size contiguous
   213	 * memory region of highest address that not yet completely DAMOS_ALLOC-ed and
   214	 * reported.
   215	 *
   216	 * TODO: Apply 'struct page' reduction in SCALE_WINDOW or lower granularity.
   217	 * E.g., hot-unplug the memory block, or apply vmemmap remapping-based approach
   218	 * like hugetlb vmemmap optimization
   219	 * (https://docs.kernel.org/mm/vmemmap_dedup.html).
   220	 */
   221	static int damon_acma_set_scale_down_region_filter(struct damos *scheme)
   222	{
   223		struct damos_filter *filter = damos_new_filter(
   224				DAMOS_FILTER_TYPE_ADDR, false);
   225		unsigned long end;
   226		unsigned long start_limit, end_limit;
   227	
   228		if (!filter)
   229			return -ENOMEM;
   230	
   231		/* scale down no below min_mem_kb */
   232		end_limit = monitor_region_end;
 > 233		start_limit = monitor_region_start + min_mem_kb * KB;
   234	
   235		/* not-completely-alloc-ed SCALE_WINDOW region of highest address */
 > 236		for (end = end_limit; end >= start_limit + SCALE_WINDOW;
   237				end -= SCALE_WINDOW) {
 > 238			if (damon_alloced_bytes(end, end - SCALE_WINDOW)
   239					!= SCALE_WINDOW)
   240				break;
   241		}
   242		filter->addr_range.start = max(start_limit, end - SCALE_WINDOW);
   243		filter->addr_range.end = end;
   244	
   245		damos_add_filter(scheme, filter);
   246		return 0;
   247	}
   248	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
