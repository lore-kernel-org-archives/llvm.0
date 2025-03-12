Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 515551F0E42;
	Wed, 12 Mar 2025 23:47:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741823247; cv=none; b=uwII/fWK3VDHuxVPeAoVOqpQxteWqSEvRb9u467pqJ9Di2gmyBv9qFncoetYBGQwPdLA9SG6sN8HyS4DX/qo7HQcZ1IxEz+rLBZs8Wfe8sWTNPajqyYx+7/YSUzOJa0XqM+LPDLN7TvQv/b6+uRICYCROWQMvsjhe715cMBOuGY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741823247; c=relaxed/simple;
	bh=Bno8m7NXKjKEszEiPNjg8MXDi+DV1o4UHSI4/MwIKUc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Z3E9cmvph9hUDHjG919ThwIIKDX0goFCbjcXGzdNGnPlqAO5be18f91HOhP908o8/NRlCDleoYnaq6iHQeD/7i8kiFoQ1XL+r2eSCA83eqGlPFoCPrtraVUST5bVLjD0VPvsuu5EpvXA5s4CNezZexkJur/KrvIeVbq+T9y0ffs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SCWzDyWC; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SCWzDyWC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1741823244; x=1773359244;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Bno8m7NXKjKEszEiPNjg8MXDi+DV1o4UHSI4/MwIKUc=;
  b=SCWzDyWCJoL0muT5kT1SBuLovC+q3v+VYU0KcGiep2WanVXy1KNzzg82
   FF+kSshUlzvqsVtU36wTENKa9ovRmJ2TL0pcjy4Tt6kqjyNnEpkdgAo1m
   59Wa521uQtkBUItBg9pAt+8COiA0VKl0JH3tuDfWvqz1XcM6UhTtraq4T
   8VxEJwJWMowNm7AhYGe182JNuNFvzT2XW+C7hRfDhBtWr0+g5CuRyW/NT
   T4vfmrgil1c5FR6maQxyu3lyxlbldHKMBgGZcUF/4MU+Nxm0oAjh+sr4d
   MrOlufQZg0qare5fWFw4XXkIdAo+g5/Lrw4/PMtr9eXFL1WXQN1eDf6Ow
   w==;
X-CSE-ConnectionGUID: y6WCOyhJQNS4HrP1y17+FA==
X-CSE-MsgGUID: VTVP1wzNSquboRnlVo5oPQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11371"; a="43125398"
X-IronPort-AV: E=Sophos;i="6.14,243,1736841600"; 
   d="scan'208";a="43125398"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Mar 2025 16:47:24 -0700
X-CSE-ConnectionGUID: F3/Jfk0VQdCynhFtPoeioA==
X-CSE-MsgGUID: Yxx3I9LoR4+cSQwxCCh+3g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,243,1736841600"; 
   d="scan'208";a="121709150"
Received: from lkp-server02.sh.intel.com (HELO a4747d147074) ([10.239.97.151])
  by orviesa008.jf.intel.com with ESMTP; 12 Mar 2025 16:47:22 -0700
Received: from kbuild by a4747d147074 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tsVnE-0008zI-0V;
	Wed, 12 Mar 2025 23:47:20 +0000
Date: Thu, 13 Mar 2025 07:46:26 +0800
From: kernel test robot <lkp@intel.com>
To: kan.liang@linux.intel.com
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH V8 2/6] perf: attach/detach PMU specific data
Message-ID: <202503130756.2j1ZuGT4-lkp@intel.com>
References: <20250312182525.4078433-2-kan.liang@linux.intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250312182525.4078433-2-kan.liang@linux.intel.com>

Hi,

kernel test robot noticed the following build errors:

[auto build test ERROR on tip/perf/core]
[also build test ERROR on next-20250312]
[cannot apply to perf-tools-next/perf-tools-next perf-tools/perf-tools linus/master acme/perf/core v6.14-rc6]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/kan-liang-linux-intel-com/perf-attach-detach-PMU-specific-data/20250313-022851
base:   tip/perf/core
patch link:    https://lore.kernel.org/r/20250312182525.4078433-2-kan.liang%40linux.intel.com
patch subject: [PATCH V8 2/6] perf: attach/detach PMU specific data
config: csky-randconfig-002-20250313 (https://download.01.org/0day-ci/archive/20250313/202503130756.2j1ZuGT4-lkp@intel.com/config)
compiler: csky-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250313/202503130756.2j1ZuGT4-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503130756.2j1ZuGT4-lkp@intel.com/

All errors (new ones prefixed by >>):

   kernel/events/core.c: In function '__free_event':
>> kernel/events/core.c:5604:18: error: 'struct perf_event' has no member named 'security'
    5604 |         if (event->security)
         |                  ^~


vim +5604 kernel/events/core.c

  5600	
  5601	/* vs perf_event_alloc() error */
  5602	static void __free_event(struct perf_event *event)
  5603	{
> 5604		if (event->security)
  5605			security_perf_event_free(event);
  5606	
  5607		if (event->attach_state & PERF_ATTACH_CALLCHAIN)
  5608			put_callchain_buffers();
  5609	
  5610		kfree(event->addr_filter_ranges);
  5611	
  5612		if (event->attach_state & PERF_ATTACH_EXCLUSIVE)
  5613			exclusive_event_destroy(event);
  5614	
  5615		if (is_cgroup_event(event))
  5616			perf_detach_cgroup(event);
  5617	
  5618		if (event->destroy)
  5619			event->destroy(event);
  5620	
  5621		/*
  5622		 * Must be after ->destroy(), due to uprobe_perf_close() using
  5623		 * hw.target.
  5624		 */
  5625		if (event->hw.target)
  5626			put_task_struct(event->hw.target);
  5627	
  5628		if (event->pmu_ctx) {
  5629			/*
  5630			 * put_pmu_ctx() needs an event->ctx reference, because of
  5631			 * epc->ctx.
  5632			 */
  5633			WARN_ON_ONCE(!event->ctx);
  5634			WARN_ON_ONCE(event->pmu_ctx->ctx != event->ctx);
  5635			put_pmu_ctx(event->pmu_ctx);
  5636		}
  5637	
  5638		/*
  5639		 * perf_event_free_task() relies on put_ctx() being 'last', in
  5640		 * particular all task references must be cleaned up.
  5641		 */
  5642		if (event->ctx)
  5643			put_ctx(event->ctx);
  5644	
  5645		if (event->pmu)
  5646			module_put(event->pmu->module);
  5647	
  5648		call_rcu(&event->rcu_head, free_event_rcu);
  5649	}
  5650	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
