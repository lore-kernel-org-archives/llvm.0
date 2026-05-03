Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE0751A6830;
	Sun,  3 May 2026 09:56:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777802197; cv=none; b=fNnHsil092EdKqo7Xd5fb+/SjwJity3tg8DC8DbsKUzAvs0Ry7u+YQjHKlZwL3ALZHMpu3rehqcWhqSUzG3Ykmxu+7pmDklO52irErZo+xIn4+1/EonlNT+9lXiZ5UTzttP6E2oIR7RMXXTP/J85w8FTqs68O/wh+A6CCszdFS4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777802197; c=relaxed/simple;
	bh=Qr2ZsxGKU/F/w2pWjXwlrOSiSjp22dKEk/5S6BBlvNU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Evo6DU0CHiy0uImGl1Qs1H0rQM5XqQpKCzVG9K457XdmjdHhnz3BbSuhOiwUxCPL+2+UDEdf8trzIUrg1SVcAce7cHkSQ7Lj25deYWZujJU8jzhw+VesrDpEHKB2vEfyjf/XVWa64a56yvHFnv2iI9xpGZenLTZIxtZJtWkKIb4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IaPdFasy; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IaPdFasy"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1777802195; x=1809338195;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Qr2ZsxGKU/F/w2pWjXwlrOSiSjp22dKEk/5S6BBlvNU=;
  b=IaPdFasy7JVGfCthlm8Kf5nqyF2WRs9DACi3D9a13hsRb+bO93lgyXx4
   HXU/69yITGmDK6YHlTwJLfGTsOeinWyjTIWiSXYDdBxkWPxHnq8M+Rjnp
   Asg4lhNcfALQIr/zdKn8Nx58xxsVzmhrI4B4mbalmoUzOR2WoEoj/pRQg
   Y2calEqu7qBcDeyaxr9iasvrRxTgImnn7lUdjz5pnLF+zVrQ9U42zICKY
   94Dz2hexkXwiGDm3n8yh37MgZ8iXGZ87NTt2qBKfKAM/3H6y9wlifkVJm
   KQLs4GX47yYWy2fmhVhrE3MEWXDm36pl+/qcuOHeIZAhV/Ens52ii8jQj
   A==;
X-CSE-ConnectionGUID: g0RVcLQlSL6iy9mPLnshVw==
X-CSE-MsgGUID: bJr9M2rIQ4Of7SObWmM/2Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11774"; a="66222954"
X-IronPort-AV: E=Sophos;i="6.23,213,1770624000"; 
   d="scan'208";a="66222954"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 May 2026 02:56:34 -0700
X-CSE-ConnectionGUID: kO6kX3J0ReqpDIpsVz/QMw==
X-CSE-MsgGUID: SCXiz9BFR2OxVjff5Hlncg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,213,1770624000"; 
   d="scan'208";a="240249483"
Received: from lkp-server01.sh.intel.com (HELO 781826d00641) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 03 May 2026 02:56:33 -0700
Received: from kbuild by 781826d00641 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wJTYs-000000002Q1-25Vr;
	Sun, 03 May 2026 09:56:30 +0000
Date: Sun, 3 May 2026 17:55:35 +0800
From: kernel test robot <lkp@intel.com>
To: Alireza Haghdoost via B4 Relay <devnull+haghdoost.uber.com@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH RFC] memcg: add per-cgroup dirty page controls
 (dirty_ratio, dirty_min)
Message-ID: <202605031710.4QHTfWdf-lkp@intel.com>
References: <20260501-rfc-memcg-dirty-v1-v1-1-9a8c80036ec1@uber.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260501-rfc-memcg-dirty-v1-v1-1-9a8c80036ec1@uber.com>

Hi Alireza,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on 254f49634ee16a731174d2ae34bc50bd5f45e731]

url:    https://github.com/intel-lab-lkp/linux/commits/Alireza-Haghdoost-via-B4-Relay/memcg-add-per-cgroup-dirty-page-controls-dirty_ratio-dirty_min/20260502-235916
base:   254f49634ee16a731174d2ae34bc50bd5f45e731
patch link:    https://lore.kernel.org/r/20260501-rfc-memcg-dirty-v1-v1-1-9a8c80036ec1%40uber.com
patch subject: [PATCH RFC] memcg: add per-cgroup dirty page controls (dirty_ratio, dirty_min)
config: um-allnoconfig (https://download.01.org/0day-ci/archive/20260503/202605031710.4QHTfWdf-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project 5bac06718f502014fade905512f1d26d578a18f3)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260503/202605031710.4QHTfWdf-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605031710.4QHTfWdf-lkp@intel.com/

All errors (new ones prefixed by >>):

>> mm/page-writeback.c:426:33: error: no member named 'memcg_css' in 'struct bdi_writeback'
     426 |                         mem_cgroup_from_css(dtc->wb->memcg_css);
         |                                             ~~~~~~~  ^
>> mm/page-writeback.c:428:19: error: incomplete definition of type 'struct mem_cgroup'
     428 |                         READ_ONCE(memcg->dirty_ratio) : 0;
         |                                   ~~~~~^
   include/linux/shrinker.h:55:9: note: forward declaration of 'struct mem_cgroup'
      55 |         struct mem_cgroup *memcg;
         |                ^
>> mm/page-writeback.c:428:19: error: incomplete definition of type 'struct mem_cgroup'
     428 |                         READ_ONCE(memcg->dirty_ratio) : 0;
         |                                   ~~~~~^
   include/linux/shrinker.h:55:9: note: forward declaration of 'struct mem_cgroup'
      55 |         struct mem_cgroup *memcg;
         |                ^
>> mm/page-writeback.c:428:19: error: incomplete definition of type 'struct mem_cgroup'
     428 |                         READ_ONCE(memcg->dirty_ratio) : 0;
         |                                   ~~~~~^
   include/linux/shrinker.h:55:9: note: forward declaration of 'struct mem_cgroup'
      55 |         struct mem_cgroup *memcg;
         |                ^
>> mm/page-writeback.c:428:19: error: incomplete definition of type 'struct mem_cgroup'
     428 |                         READ_ONCE(memcg->dirty_ratio) : 0;
         |                                   ~~~~~^
   include/linux/shrinker.h:55:9: note: forward declaration of 'struct mem_cgroup'
      55 |         struct mem_cgroup *memcg;
         |                ^
>> mm/page-writeback.c:428:19: error: incomplete definition of type 'struct mem_cgroup'
     428 |                         READ_ONCE(memcg->dirty_ratio) : 0;
         |                                   ~~~~~^
   include/linux/shrinker.h:55:9: note: forward declaration of 'struct mem_cgroup'
      55 |         struct mem_cgroup *memcg;
         |                ^
>> mm/page-writeback.c:428:19: error: incomplete definition of type 'struct mem_cgroup'
     428 |                         READ_ONCE(memcg->dirty_ratio) : 0;
         |                                   ~~~~~^
   include/linux/shrinker.h:55:9: note: forward declaration of 'struct mem_cgroup'
      55 |         struct mem_cgroup *memcg;
         |                ^
>> mm/page-writeback.c:428:19: error: incomplete definition of type 'struct mem_cgroup'
     428 |                         READ_ONCE(memcg->dirty_ratio) : 0;
         |                                   ~~~~~^
   include/linux/shrinker.h:55:9: note: forward declaration of 'struct mem_cgroup'
      55 |         struct mem_cgroup *memcg;
         |                ^
>> mm/page-writeback.c:1912:5: error: call to undeclared function 'mem_cgroup_from_task'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    1912 |                                 mem_cgroup_from_task(current);
         |                                 ^
   mm/page-writeback.c:1912:5: note: did you mean 'mem_cgroup_from_css'?
   include/linux/memcontrol.h:1211:20: note: 'mem_cgroup_from_css' declared here
    1211 | struct mem_cgroup *mem_cgroup_from_css(struct cgroup_subsys_state *css)
         |                    ^
>> mm/page-writeback.c:1911:23: error: incompatible integer to pointer conversion initializing 'struct mem_cgroup *' with an expression of type 'int' [-Wint-conversion]
    1911 |                         struct mem_cgroup *memcg =
         |                                            ^
    1912 |                                 mem_cgroup_from_task(current);
         |                                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   mm/page-writeback.c:1915:35: error: incomplete definition of type 'struct mem_cgroup'
    1915 |                                 cg_dirty_min = READ_ONCE(memcg->dirty_min);
         |                                                          ~~~~~^
   include/linux/shrinker.h:55:9: note: forward declaration of 'struct mem_cgroup'
      55 |         struct mem_cgroup *memcg;
         |                ^
   mm/page-writeback.c:1915:35: error: incomplete definition of type 'struct mem_cgroup'
    1915 |                                 cg_dirty_min = READ_ONCE(memcg->dirty_min);
         |                                                          ~~~~~^
   include/linux/shrinker.h:55:9: note: forward declaration of 'struct mem_cgroup'
      55 |         struct mem_cgroup *memcg;
         |                ^
   mm/page-writeback.c:1915:35: error: incomplete definition of type 'struct mem_cgroup'
    1915 |                                 cg_dirty_min = READ_ONCE(memcg->dirty_min);
         |                                                          ~~~~~^
   include/linux/shrinker.h:55:9: note: forward declaration of 'struct mem_cgroup'
      55 |         struct mem_cgroup *memcg;
         |                ^
   mm/page-writeback.c:1915:35: error: incomplete definition of type 'struct mem_cgroup'
    1915 |                                 cg_dirty_min = READ_ONCE(memcg->dirty_min);
         |                                                          ~~~~~^
   include/linux/shrinker.h:55:9: note: forward declaration of 'struct mem_cgroup'
      55 |         struct mem_cgroup *memcg;
         |                ^
   mm/page-writeback.c:1915:35: error: incomplete definition of type 'struct mem_cgroup'
    1915 |                                 cg_dirty_min = READ_ONCE(memcg->dirty_min);
         |                                                          ~~~~~^
   include/linux/shrinker.h:55:9: note: forward declaration of 'struct mem_cgroup'
      55 |         struct mem_cgroup *memcg;
         |                ^
   mm/page-writeback.c:1915:35: error: incomplete definition of type 'struct mem_cgroup'
    1915 |                                 cg_dirty_min = READ_ONCE(memcg->dirty_min);
         |                                                          ~~~~~^
   include/linux/shrinker.h:55:9: note: forward declaration of 'struct mem_cgroup'
      55 |         struct mem_cgroup *memcg;
         |                ^
   mm/page-writeback.c:1915:35: error: incomplete definition of type 'struct mem_cgroup'
    1915 |                                 cg_dirty_min = READ_ONCE(memcg->dirty_min);
         |                                                          ~~~~~^
   include/linux/shrinker.h:55:9: note: forward declaration of 'struct mem_cgroup'
      55 |         struct mem_cgroup *memcg;
         |                ^
   mm/page-writeback.c:1968:36: error: no member named 'memcg_css' in 'struct bdi_writeback'
    1968 |                                         mem_cgroup_from_css(mdtc->wb->memcg_css);
         |                                                             ~~~~~~~~  ^
   18 errors generated.


vim +426 mm/page-writeback.c

   341	
   342	/**
   343	 * domain_dirty_limits - calculate thresh and bg_thresh for a wb_domain
   344	 * @dtc: dirty_throttle_control of interest
   345	 *
   346	 * Calculate @dtc->thresh and ->bg_thresh considering
   347	 * vm_dirty_{bytes|ratio} and dirty_background_{bytes|ratio}.  The caller
   348	 * must ensure that @dtc->avail is set before calling this function.  The
   349	 * dirty limits will be lifted by 1/4 for real-time tasks.
   350	 */
   351	static void domain_dirty_limits(struct dirty_throttle_control *dtc)
   352	{
   353		const unsigned long available_memory = dtc->avail;
   354		struct dirty_throttle_control *gdtc = mdtc_gdtc(dtc);
   355		unsigned long bytes = vm_dirty_bytes;
   356		unsigned long bg_bytes = dirty_background_bytes;
   357		/* convert ratios to per-PAGE_SIZE for higher precision */
   358		unsigned long ratio = (vm_dirty_ratio * PAGE_SIZE) / 100;
   359		unsigned long bg_ratio = (dirty_background_ratio * PAGE_SIZE) / 100;
   360		unsigned long thresh;
   361		unsigned long bg_thresh;
   362		struct task_struct *tsk;
   363	
   364		/* gdtc is !NULL iff @dtc is for memcg domain */
   365		if (gdtc) {
   366			unsigned long global_avail = gdtc->avail;
   367	
   368			/*
   369			 * The byte settings can't be applied directly to memcg
   370			 * domains.  Convert them to ratios by scaling against
   371			 * globally available memory.  As the ratios are in
   372			 * per-PAGE_SIZE, they can be obtained by dividing bytes by
   373			 * number of pages.
   374			 */
   375			if (bytes)
   376				ratio = min(DIV_ROUND_UP(bytes, global_avail),
   377					    PAGE_SIZE);
   378			if (bg_bytes)
   379				bg_ratio = min(DIV_ROUND_UP(bg_bytes, global_avail),
   380					       PAGE_SIZE);
   381			bytes = bg_bytes = 0;
   382		}
   383	
   384		if (bytes)
   385			thresh = DIV_ROUND_UP(bytes, PAGE_SIZE);
   386		else
   387			thresh = (ratio * available_memory) / PAGE_SIZE;
   388	
   389		if (bg_bytes)
   390			bg_thresh = DIV_ROUND_UP(bg_bytes, PAGE_SIZE);
   391		else
   392			bg_thresh = (bg_ratio * available_memory) / PAGE_SIZE;
   393	
   394		tsk = current;
   395		if (rt_or_dl_task(tsk)) {
   396			bg_thresh += bg_thresh / 4 + global_wb_domain.dirty_limit / 32;
   397			thresh += thresh / 4 + global_wb_domain.dirty_limit / 32;
   398		}
   399	
   400		/*
   401		 * Apply the per-memcg dirty_ratio clamp on mdtc (gdtc != NULL
   402		 * iff @dtc is a memcg dtc).  dirty_ratio is scaled against
   403		 * the memcg's own dirtyable memory (@available_memory), matching
   404		 * the semantics of vm_dirty_ratio so the two knobs share a base
   405		 * and compose via a plain min() on thresh.  The clamp is keyed
   406		 * on wb->memcg_css (the inode-owner's memcg) rather than on
   407		 * current's memcg, so balance_dirty_pages(), wb_over_bg_thresh()
   408		 * (flusher kworker context), and cgwb_calc_thresh() all see the
   409		 * same clamped value.
   410		 *
   411		 * Published on dtc->cg_dirty_cap as well so hard_dirty_limit()
   412		 * callers in balance_dirty_pages() can ignore the slower
   413		 * dom->dirty_limit smoothing when deriving setpoint/
   414		 * rate-limit from the clamped ceiling.
   415		 *
   416		 * Clamp is applied after the rt/dl boost: dirty_ratio is a
   417		 * strict override, not widened by priority.  bg_thresh is
   418		 * scaled by the same factor we apply to thresh so the
   419		 * user-configured bg/thresh ratio survives clamping instead
   420		 * of snapping to thresh/2 via the bg_thresh >= thresh guard
   421		 * below.  mult_frac() preserves precision for small memcgs
   422		 * where a plain "(avail / 100) * ratio" would collapse to 0.
   423		 */
   424		if (gdtc) {
   425			struct mem_cgroup *memcg =
 > 426				mem_cgroup_from_css(dtc->wb->memcg_css);
   427			unsigned int cg_ratio = memcg ?
 > 428				READ_ONCE(memcg->dirty_ratio) : 0;
   429	
   430			/*
   431			 * dtc is reused across balance_dirty_pages() iterations,
   432			 * so reset the published clamp every call -- an admin
   433			 * clearing memory.dirty_ratio mid-flight must take effect
   434			 * on the next pass.
   435			 */
   436			dtc->cg_dirty_cap = PAGE_COUNTER_MAX;
   437	
   438			if (cg_ratio) {
   439				unsigned long cg_thresh = mult_frac(available_memory,
   440								    cg_ratio, 100);
   441	
   442				if (cg_thresh < thresh) {
   443					bg_thresh = mult_frac(bg_thresh, cg_thresh,
   444							      thresh);
   445					thresh = cg_thresh;
   446					dtc->cg_dirty_cap = cg_thresh;
   447				}
   448			}
   449		}
   450	
   451		/*
   452		 * Dirty throttling logic assumes the limits in page units fit into
   453		 * 32-bits. This gives 16TB dirty limits max which is hopefully enough.
   454		 */
   455		if (thresh > UINT_MAX)
   456			thresh = UINT_MAX;
   457		/* This makes sure bg_thresh is within 32-bits as well */
   458		if (bg_thresh >= thresh)
   459			bg_thresh = thresh / 2;
   460		dtc->thresh = thresh;
   461		dtc->bg_thresh = bg_thresh;
   462	
   463		/* we should eventually report the domain in the TP */
   464		if (!gdtc)
   465			trace_global_dirty_state(bg_thresh, thresh);
   466	}
   467	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
