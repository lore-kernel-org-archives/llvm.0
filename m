Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A179381ACA;
	Sun, 21 Dec 2025 20:55:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766350512; cv=none; b=M74uUnfGnSQbg0ulR7WfeSEME3o43w5OIxX8CfeIQC92lsmk61mkCnXw0IbpVRYAWehPHPiyvK7xEBGdT5xi18wE6b6fSb+nyPyb0r/s/n6Kc9evXuZ2KIWMz0l1Zbz0eP/FXWBi4LzSgzt+grOdcMUTT17t/86QYr3iXJtczRM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766350512; c=relaxed/simple;
	bh=ylQv2apO3GZuwcXTS+Va+7Q2KmElHrBCdTtIAR3LXBo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=o+jXtplTGNiUaS0j42Ec/uDnvAK/TECB9CpLnFU/2cHTz6jzWYSFkPEkgeybbeNPJtS86nS4fPlmQEIgdDQUBRzAy7L//uvjRS+jtbb5X9CK2q/p/Pdye2RWMtUnHXIufNoNEQ8dHQiN1EdQmdQ7KZjh7iR2V3DZpIV+UIISoQ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VuEDS27o; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VuEDS27o"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766350511; x=1797886511;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=ylQv2apO3GZuwcXTS+Va+7Q2KmElHrBCdTtIAR3LXBo=;
  b=VuEDS27oRSubRLfm6SVPVqIcy6poO6J0ktnGYVgcc42rn+tZoVo7TC0u
   hfiC1EikIrxNJXLLXACTbsUGrbkGPZKr9CyNBc69O27a5dEM5rwIJ2qTc
   bqoWVs0yDMMKykXcv+j03PdwXcOAh7GEIebGW7iZ5SgxxfJLfmhgvWJLj
   +MovrGd6NgTixxuqHmqNvlSzIiA32WMnfCEUWcVh4+fSIz1DuDzPd/Pb3
   sWC/qH+g6ldi1xUL8UyKT8UGaNbPjlxACb6EJlZRvXqcFpx32j1b7cB4V
   9LTFjVReNMNqeBVCpMiQ+nXcwzL2+FHEz7rDHOeQcuHIpUmcDjC0y4EYR
   Q==;
X-CSE-ConnectionGUID: LLTjcJMhQ8WYEXIksefTIg==
X-CSE-MsgGUID: wAaIddcJQOGIpGcphcrphw==
X-IronPort-AV: E=McAfee;i="6800,10657,11649"; a="79673866"
X-IronPort-AV: E=Sophos;i="6.21,166,1763452800"; 
   d="scan'208";a="79673866"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Dec 2025 12:55:10 -0800
X-CSE-ConnectionGUID: CCh31AOZSq+zbw6znigUEg==
X-CSE-MsgGUID: pSbmKb/BRSWppP6Y3qj19A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,166,1763452800"; 
   d="scan'208";a="199004900"
Received: from igk-lkp-server01.igk.intel.com (HELO 8a0c053bdd2a) ([10.211.93.152])
  by fmviesa007.fm.intel.com with ESMTP; 21 Dec 2025 12:55:08 -0800
Received: from kbuild by 8a0c053bdd2a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vXQSH-000000005Ea-31Sd;
	Sun, 21 Dec 2025 20:55:05 +0000
Date: Sun, 21 Dec 2025 21:54:58 +0100
From: kernel test robot <lkp@intel.com>
To: Zhan Xusheng <zhanxusheng1024@gmail.com>, peterz@infradead.org
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	vincent.guittot@linaro.org, dietmar.eggemann@arm.com,
	linux-sched@vger.kernel.org, linux-kernel@vger.kernel.org,
	Zhan Xusheng <zhanxusheng@xiaomi.com>
Subject: Re: [PATCH] sched/fair: factor out common sched_entity stats/task
 lookup
Message-ID: <202512212116.MgXjzmJz-lkp@intel.com>
References: <20251217070040.8723-1-zhanxusheng@xiaomi.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251217070040.8723-1-zhanxusheng@xiaomi.com>

Hi Zhan,

kernel test robot noticed the following build errors:

[auto build test ERROR on tip/sched/core]
[also build test ERROR on peterz-queue/sched/core linus/master v6.19-rc1 next-20251219]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Zhan-Xusheng/sched-fair-factor-out-common-sched_entity-stats-task-lookup/20251217-150252
base:   tip/sched/core
patch link:    https://lore.kernel.org/r/20251217070040.8723-1-zhanxusheng%40xiaomi.com
patch subject: [PATCH] sched/fair: factor out common sched_entity stats/task lookup
config: x86_64-kexec (https://download.01.org/0day-ci/archive/20251221/202512212116.MgXjzmJz-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251221/202512212116.MgXjzmJz-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512212116.MgXjzmJz-lkp@intel.com/

All errors (new ones prefixed by >>):

>> kernel/sched/fair.c:1337:37: error: use of undeclared identifier 'p'
    1337 |         get_se_stats_and_task(se, &stats, &p);
         |                                            ^
   1 error generated.


vim +/p +1337 kernel/sched/fair.c

  1327	
  1328	static inline void
  1329	update_stats_enqueue_sleeper_fair(struct cfs_rq *cfs_rq, struct sched_entity *se)
  1330	{
  1331		struct sched_statistics *stats;
  1332		struct task_struct *tsk = NULL;
  1333	
  1334		if (!schedstat_enabled())
  1335			return;
  1336	
> 1337		get_se_stats_and_task(se, &stats, &p);
  1338	
  1339		__update_stats_enqueue_sleeper(rq_of(cfs_rq), tsk, stats);
  1340	}
  1341	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
