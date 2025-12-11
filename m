Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64A75301480;
	Thu, 11 Dec 2025 08:50:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765443053; cv=none; b=lVD9eDkzWqc1eQF0lRQ65murD/RDJxfLpgYBoiIDfXiya32KUDqD6Fhw4Diz0gYWf/LWcmgnfvK6iKGwd2jCdYhDNvmlPJ0Xy/FgTz/MiscudB9syJ7LaHCT8BPiMsSuv1H1SmJN4/uSS+T2TPRIiSnAI+loHZ601FBWEJ/VoX4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765443053; c=relaxed/simple;
	bh=al99j6p0cDAh5F30IQJcCGcwOmWRWrs7RhVjRTAhYQo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NNSvu4k264tDF6R/kp6H/5dSpv8Zwx5XHffYpg1u1De6sFW3dYPI8ncwQhX5D+R0scVo2Oez+pQsGavk2OiRq42SuiS5se2tj+cjclViVPgs6bMIzd140yl0rGn0DVGf5SbU2gztgI1n5aMswd/hQ4zpmW8bSSJ7XgX8azip+YE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JVD/DNTh; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JVD/DNTh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765443051; x=1796979051;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=al99j6p0cDAh5F30IQJcCGcwOmWRWrs7RhVjRTAhYQo=;
  b=JVD/DNTh6jTayx5mOVfHgBYXCsl7avaMxChvDhZO0SI+II+ulrsK7u84
   /NsQrZP9/nCiR+nN6NDHQBRr1cVngI29ed9Z/vP5GQxN04w8cFSQhboDC
   y8Hl53LGqU2sQRIaMMtIU/f/RQZz/m+oEY/LVpk0C++WShMTswte1i/0e
   Lk/NtFdRHOKKZ1uUuleEu3bG5BI+yZ2rrb1hIPgzdjjCTVECm3K+AYPj8
   xW2YlSg7KlLKNUbXF20eAo7Hmmxmnt8hRJ5JeRngPTzNZoJRqtQpPxVRR
   3dEMpXFrXgL7GtdXUPXKE0SEgt6/H5zON865DwxoPs9SWiI37LmWA4RS5
   g==;
X-CSE-ConnectionGUID: oJMCg/kdQxOP2QOftviDhw==
X-CSE-MsgGUID: WR+4B/71Qv+fFtn3iS4qCA==
X-IronPort-AV: E=McAfee;i="6800,10657,11638"; a="92900913"
X-IronPort-AV: E=Sophos;i="6.20,265,1758610800"; 
   d="scan'208";a="92900913"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Dec 2025 00:50:51 -0800
X-CSE-ConnectionGUID: tZhMugYAS3qduxAYwdBuPQ==
X-CSE-MsgGUID: ryDETTF9To+XS61m19t5MQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,265,1758610800"; 
   d="scan'208";a="201169662"
Received: from lkp-server01.sh.intel.com (HELO d335e3c6db51) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 11 Dec 2025 00:50:49 -0800
Received: from kbuild by d335e3c6db51 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vTcNr-000000004Qr-2kI1;
	Thu, 11 Dec 2025 08:50:47 +0000
Date: Thu, 11 Dec 2025 16:50:15 +0800
From: kernel test robot <lkp@intel.com>
To: Enze Li <lienze@kylinos.cn>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH 1/2] mm/damon/auto-tuning: introduce DAMON-based
 auto-tunning module
Message-ID: <202512111604.B1hpFdVs-lkp@intel.com>
References: <20251209145026.3263754-2-lienze@kylinos.cn>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251209145026.3263754-2-lienze@kylinos.cn>

Hi Enze,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build warnings:

[auto build test WARNING on akpm-mm/mm-everything]

url:    https://github.com/intel-lab-lkp/linux/commits/Enze-Li/mm-damon-auto-tuning-introduce-DAMON-based-auto-tunning-module/20251210-025514
base:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-everything
patch link:    https://lore.kernel.org/r/20251209145026.3263754-2-lienze%40kylinos.cn
patch subject: [RFC PATCH 1/2] mm/damon/auto-tuning: introduce DAMON-based auto-tunning module
config: x86_64-allmodconfig (https://download.01.org/0day-ci/archive/20251211/202512111604.B1hpFdVs-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251211/202512111604.B1hpFdVs-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512111604.B1hpFdVs-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> mm/damon/auto-tuning.c:155:21: warning: variable 'adjust_priority' is uninitialized when used here [-Wuninitialized]
     155 |                 adjust_priority = adjust_priority * decay_factor / 10;
         |                                   ^~~~~~~~~~~~~~~
   mm/damon/auto-tuning.c:134:31: note: initialize the variable 'adjust_priority' to silence this warning
     134 |         unsigned long adjust_priority, metric;
         |                                      ^
         |                                       = 0
>> mm/damon/auto-tuning.c:283:6: warning: variable 'err' is used uninitialized whenever 'if' condition is false [-Wsometimes-uninitialized]
     283 |         if (!damon_initialized()) {
         |             ^~~~~~~~~~~~~~~~~~~~
   mm/damon/auto-tuning.c:291:9: note: uninitialized use occurs here
     291 |         return err;
         |                ^~~
   mm/damon/auto-tuning.c:283:2: note: remove the 'if' if its condition is always true
     283 |         if (!damon_initialized()) {
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~
   mm/damon/auto-tuning.c:281:9: note: initialize the variable 'err' to silence this warning
     281 |         int err;
         |                ^
         |                 = 0
   2 warnings generated.


vim +/adjust_priority +155 mm/damon/auto-tuning.c

   130	
   131	static bool _damon_auto_tuning_wmarks(struct damon_ctx *c, struct damos *s,
   132					      struct damon_target *t)
   133	{
   134		unsigned long adjust_priority, metric;
   135		int min = damon_targets_priority_min(c);
   136		int max = damon_targets_priority_max(c);
   137		int nr_targets = damon_nr_targets(c);
   138		int decay_factor = max_nr_targets - nr_targets;
   139	
   140		metric = global_zone_page_state(NR_FREE_PAGES) * 1000 /
   141			 totalram_pages();
   142	
   143		/*
   144		 * We are now ready to start adjusting the watermarks based on
   145		 * priority.  The goal is to set each target's watermark above the
   146		 * system's high watermark (to prevent it from triggering system-wide
   147		 * actions) and below its initial memory capacity, as determined by
   148		 * its importance.
   149		 */
   150		pr_debug("%s: metric=%ld\n", __func__, metric);
   151		/* TODO: Here, we need to use the system's high watermark value, and
   152		 * will temporarily substitute it with 100.
   153		 */
   154		if (nr_targets < max_nr_targets)
 > 155			adjust_priority = adjust_priority * decay_factor / 10;
   156		adjust_priority = (t->priority - min) * (metric - 100) / (max - min) + 100;
   157	
   158		s->wmarks.high = adjust_priority;
   159		s->wmarks.mid = adjust_priority;
   160		s->wmarks.low = 0;
   161		return true;
   162	}
   163	
   164	static bool damon_auto_tuning_wmarks(struct damon_ctx *c)
   165	{
   166		struct damon_target *t;
   167		struct damos *s, *next;
   168		struct damos_filter *f;
   169	
   170		damon_for_each_target(t, c) {
   171			if (c->ops.target_valid && c->ops.target_valid(t)) {
   172				damon_for_each_scheme_safe(s, next, c) {
   173					damos_for_each_core_filter(f, s) {
   174						if (damon_target_filter_match(c, f, t)) {
   175							pr_debug("%s: priority=%d(idx=%d)\n",
   176								 __func__, t->priority,
   177								 f->target_idx);
   178							_damon_auto_tuning_wmarks(c, s, t);
   179						}
   180					}
   181				}
   182			}
   183		}
   184		damon_targets_print_info(c);
   185		return true;
   186	}
   187	
   188	static bool damon_targets_auto_tuning_tick(struct damon_ctx *c,
   189						   bool init_wmarks)
   190	{
   191		int nr_targets = 0;
   192		unsigned long cur_jiffies = jiffies;
   193		static unsigned long last_jiffies;
   194	
   195		if (last_jiffies != 0) {
   196			if (time_is_after_jiffies(last_jiffies + 5 * HZ))
   197				return false;
   198		}
   199	
   200		pr_debug("%s %ld %ld\n", __func__, cur_jiffies, last_jiffies + 5 * HZ);
   201		last_jiffies = cur_jiffies;
   202	
   203		/*
   204		 * Any change in the number of targets necessitates a recalibration of
   205		 * the per-task watermarks.
   206		 */
   207		nr_targets = damon_nr_targets(auto_ctx);
   208		if (auto_targets != nr_targets) {
   209			damon_auto_tuning_wmarks(auto_ctx);
   210			auto_targets = nr_targets;
   211		}
   212	
   213		if (max_nr_targets < auto_targets)
   214			max_nr_targets = auto_targets;
   215	
   216		return true;
   217	}
   218	
   219	static bool damon_targets_auto_tuning_init(struct damon_ctx *c)
   220	{
   221		struct damon_target *t;
   222		struct damos *s, *next, *new_scheme;
   223		struct damos_filter *new_filter;
   224		int i = 0;
   225	
   226		init_auto_tuning = true;
   227		auto_ctx = c;
   228	
   229		damon_for_each_scheme_safe(s, next, c)
   230			damon_destroy_scheme(s);
   231	
   232		damon_for_each_target(t, c) {
   233			new_scheme = damon_auto_tuning_new_scheme();
   234			if (!new_scheme)
   235				return -ENOMEM;
   236	
   237			new_filter = damos_new_filter(DAMOS_FILTER_TYPE_TARGET, true, true);
   238			if (!new_filter)
   239				return -ENOMEM;
   240			new_filter->target_idx = i++;
   241	
   242			damos_add_filter(new_scheme, new_filter);
   243			damon_add_scheme(c, new_scheme);
   244	
   245			pr_info("\t add scheme %d\n", auto_targets);
   246			auto_targets++;
   247		}
   248	
   249		max_nr_targets = auto_targets;
   250	
   251		damon_targets_print_info(c);
   252		damon_auto_tuning_wmarks(c);
   253		damon_targets_print_info(c);
   254	
   255		return true;
   256	}
   257	
   258	static bool damon_targets_priority_enabled(struct damon_ctx *c)
   259	{
   260		struct damon_target *t;
   261	
   262		damon_for_each_target(t, c)
   263			if (t->priority > 0)
   264				return true;
   265		return false;
   266	}
   267	
   268	bool kdamond_targets_auto_tuning(struct damon_ctx *c)
   269	{
   270		if (damon_targets_priority_enabled(c)) {
   271			if (!init_auto_tuning)
   272				damon_targets_auto_tuning_init(c);
   273			else
   274				damon_targets_auto_tuning_tick(c, false);
   275		}
   276		return false;
   277	}
   278	
   279	static int __init damon_auto_tuning_init(void)
   280	{
   281		int err;
   282	
 > 283		if (!damon_initialized()) {
   284			err = -ENOMEM;
   285			goto out;
   286		}
   287		init_metric = global_zone_page_state(NR_FREE_PAGES) * 1000 /
   288			      totalram_pages();
   289		pr_info("%s init_metric=%ld\n", __func__,  init_metric);
   290	out:
   291		return err;
   292	}
   293	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
