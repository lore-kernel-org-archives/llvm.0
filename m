Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E68111EF389;
	Wed, 12 Mar 2025 23:24:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741821844; cv=none; b=GHUFWsl9xlLoHmKtAZb5MHl5fg24LnszdQqSKXmYCms2FqvJuVfHa6zMwBBrEFSbrDrXSoOoMPuBsNFc19qBsCiyKnXM/e/gqxJzsRTdUUXnauEGgr+80dcQxuoFOyEtCLx9HmlqR9NlPhtGK2bhkD/HDPBACDOkJ90A3oS8/K8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741821844; c=relaxed/simple;
	bh=KHVGi6EeY1QYxOlcB8rkUUmuAe6VGkayj/4+oGezi60=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rc1DAgkEJxmcRjSjNasmS9xwZmb/co9cISgtZdxXuuAFkmEkOMYHcY9T+IHcklyAUEUylWcVZoPBrr6ba16to7kLyvAK2rxpe4P6KKTDBa61vZ2mBefpjRi+6pTX84JHlPZ1732SdZKUKS/GlWz1olLT1RI2zFsXiZkqNrmj2bs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=O2zg1YKn; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="O2zg1YKn"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1741821843; x=1773357843;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=KHVGi6EeY1QYxOlcB8rkUUmuAe6VGkayj/4+oGezi60=;
  b=O2zg1YKnIKEKntzJq/LQAkU4yCfZe6MHr8EKIgwwkLDboH+kCvTzHEBa
   CX8hT+wluo8c5xSG0jo56+hZKldHgYFXMKHYPdopPqD8qGu+GbQDRLmbM
   u1u/dzU+1MuanGHDhpyBUDgRUjqhXoXlA9xj8wMXcmHd+LNTfBecLKXxm
   UYyYL2NzLFLKVKhpRcoo/U0lyqjhNIO39b1c+ZNfiCTuQltuy5WlYLrzI
   3yTaKsts9y6cU07Em9PA8nw3+XdArwZTuZHW+RzyYmw92o4pXvJZYO9F7
   OdqXkgbDZHgJtK3KhxTIKLGSjj37Chn+c1k8SXz8qtRc9W7t4u0eZJBx1
   g==;
X-CSE-ConnectionGUID: +J1bWyYnRp6wlTqFq7Jk9A==
X-CSE-MsgGUID: fm54DamCQnu6DU72LmlTMg==
X-IronPort-AV: E=McAfee;i="6700,10204,11371"; a="43105628"
X-IronPort-AV: E=Sophos;i="6.14,243,1736841600"; 
   d="scan'208";a="43105628"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Mar 2025 16:24:03 -0700
X-CSE-ConnectionGUID: P/Vu9LfHQdSiklkHaXFsjw==
X-CSE-MsgGUID: J6Ar2AivS7yrGF3tn3JdhQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,243,1736841600"; 
   d="scan'208";a="151609212"
Received: from lkp-server02.sh.intel.com (HELO a4747d147074) ([10.239.97.151])
  by orviesa002.jf.intel.com with ESMTP; 12 Mar 2025 16:24:01 -0700
Received: from kbuild by a4747d147074 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tsVQc-0008y8-2I;
	Wed, 12 Mar 2025 23:23:58 +0000
Date: Thu, 13 Mar 2025 07:23:30 +0800
From: kernel test robot <lkp@intel.com>
To: kan.liang@linux.intel.com
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH V8 2/6] perf: attach/detach PMU specific data
Message-ID: <202503130704.dGVT7UMi-lkp@intel.com>
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
config: i386-buildonly-randconfig-005-20250313 (https://download.01.org/0day-ci/archive/20250313/202503130704.dGVT7UMi-lkp@intel.com/config)
compiler: clang version 19.1.7 (https://github.com/llvm/llvm-project cd708029e0b2869e80abe31ddb175f7c35361f90)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250313/202503130704.dGVT7UMi-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503130704.dGVT7UMi-lkp@intel.com/

All errors (new ones prefixed by >>):

>> kernel/events/core.c:5604:13: error: no member named 'security' in 'struct perf_event'
    5604 |         if (event->security)
         |             ~~~~~  ^
   1 error generated.


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
