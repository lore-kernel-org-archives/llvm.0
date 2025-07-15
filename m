Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64EAA34CF5;
	Tue, 15 Jul 2025 01:13:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752542029; cv=none; b=dpaG8FC19bEnAvhwH7t37Rt7y6eRlO26YS3TUU3uee+cJlsScg2wNXGVnjPPBzxZdYy3leflfJdHtTT9GuMYS6sMg7FB4rChsgruQ3BSD5ehTpPIQjSnX9SJWycGvI71EQu0HaSRA4xPQ0bEpSN1foJVqK8fMzNYYD8ScI7rL3s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752542029; c=relaxed/simple;
	bh=5WTRkC40W62d+Ef4e5kWF7Y93DBlymTa5mTnEaGKWhU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Wad1SP2K3uAyqlPI+oDUtwaIQq2a37mIYbkBXwiAfOhiy2MY5EAh/9/OiUmbXTjxEP9VV0wodCBvIqOcBuQp0a7fKE9RnE3r5Ne6jGYLYFpWarXA1A+u5Vwnj9ODZhSi+OdHBNTX1gwvPpDOiOL7SN9f+DvO20C1eBLeElvbTJo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NWM99jKr; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NWM99jKr"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1752542028; x=1784078028;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=5WTRkC40W62d+Ef4e5kWF7Y93DBlymTa5mTnEaGKWhU=;
  b=NWM99jKrtbKdFOlOWS/OCzpbB+kYZsQTYo1UBr4coY/eEXJhgTOpNhN9
   v8S8fq0q81o6PiRRNNIW/H9xouGipDrcejl8AgrI92be7ugUQcnuHGjWT
   wUKUAg1AV/UuwA2gkNp9SbCQfS4qXohuPFPbz0EEp41m9Chy5cWjDD/vZ
   tc8uiKblYPigSZ4EH2Dw3LAAXUDBoDEXoTUT6VtchRBN0gE7D5CA7gXmR
   FZseSKWKUX39/oV8XKisX3FA8H61AzFfN84ygG1vemdH1R2Coq+h5AvSQ
   KU+6XiTBS2n4XBnIbP3Ve4KGJun0E9CvIieGuoW6PsvIFPMM9MCGgZsY/
   g==;
X-CSE-ConnectionGUID: lMosn+ZHRr+Bapy3uWbGKA==
X-CSE-MsgGUID: Y9DDy04fQpa1LeF2VwOmNA==
X-IronPort-AV: E=McAfee;i="6800,10657,11491"; a="58405589"
X-IronPort-AV: E=Sophos;i="6.16,312,1744095600"; 
   d="scan'208";a="58405589"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jul 2025 18:13:47 -0700
X-CSE-ConnectionGUID: 89LDMo4TQ16905S8Avn2Bw==
X-CSE-MsgGUID: cNonXrFNSVSum+L7oHCyrg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,312,1744095600"; 
   d="scan'208";a="156901030"
Received: from lkp-server01.sh.intel.com (HELO 9ee84586c615) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 14 Jul 2025 18:13:45 -0700
Received: from kbuild by 9ee84586c615 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ubUEp-0009VD-12;
	Tue, 15 Jul 2025 01:13:43 +0000
Date: Tue, 15 Jul 2025 09:13:12 +0800
From: kernel test robot <lkp@intel.com>
To: Vinicius Costa Gomes <vinicius.gomes@intel.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC] sched/fair: Mitigate the impact of retrieving tg->load_avg
Message-ID: <202507150900.nqPPaczK-lkp@intel.com>
References: <20250714232915.523679-1-vinicius.gomes@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250714232915.523679-1-vinicius.gomes@intel.com>

Hi Vinicius,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on v6.16-rc6]
[also build test ERROR on linus/master]
[cannot apply to tip/sched/core next-20250714]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Vinicius-Costa-Gomes/sched-fair-Mitigate-the-impact-of-retrieving-tg-load_avg/20250715-073036
base:   v6.16-rc6
patch link:    https://lore.kernel.org/r/20250714232915.523679-1-vinicius.gomes%40intel.com
patch subject: [RFC] sched/fair: Mitigate the impact of retrieving tg->load_avg
config: loongarch-randconfig-001-20250715 (https://download.01.org/0day-ci/archive/20250715/202507150900.nqPPaczK-lkp@intel.com/config)
compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project 16534d19bf50bde879a83f0ae62875e2c5120e64)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250715/202507150900.nqPPaczK-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507150900.nqPPaczK-lkp@intel.com/

All errors (new ones prefixed by >>):

>> kernel/sched/fair.c:4000:21: error: no member named 'last_update_tg_load_avg' in 'struct cfs_rq'
    4000 |         if (now - gcfs_rq->last_update_tg_load_avg < NSEC_PER_MSEC)
         |                   ~~~~~~~  ^
   1 error generated.


vim +4000 kernel/sched/fair.c

  3974	
  3975	/*
  3976	 * Recomputes the group entity based on the current state of its group
  3977	 * runqueue.
  3978	 */
  3979	static void update_cfs_group(struct sched_entity *se)
  3980	{
  3981		struct cfs_rq *gcfs_rq = group_cfs_rq(se);
  3982		long shares;
  3983		u64 now;
  3984	
  3985		/*
  3986		 * When a group becomes empty, preserve its weight. This matters for
  3987		 * DELAY_DEQUEUE.
  3988		 */
  3989		if (!gcfs_rq || !gcfs_rq->load.weight)
  3990			return;
  3991	
  3992		if (throttled_hierarchy(gcfs_rq))
  3993			return;
  3994	
  3995		/*
  3996		 * For migration heavy workloads, access to tg->load_avg can be
  3997		 * unbound. Limit the update rate to at most once per ms.
  3998		 */
  3999		now = sched_clock_cpu(cpu_of(rq_of(gcfs_rq)));
> 4000		if (now - gcfs_rq->last_update_tg_load_avg < NSEC_PER_MSEC)
  4001			return;
  4002	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
