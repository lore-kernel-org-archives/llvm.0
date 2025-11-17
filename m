Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABDF1329E7B;
	Mon, 17 Nov 2025 11:01:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763377314; cv=none; b=gUwT2lLwGXy1qhaatlpA0Dgq8uMJnhdFtryX22oKpJYdrW6JlYYGyAa9pqbLciz6WBN6MJAQyGgkSVdDUkqv4qY8jX8xWe3umiulMXHbRusp+OaM6Ljc8ldiZw0mAi8gBkH1V48q+y1cn4o4RhmcnNT36rRfYMxkOfrHe8eu+K8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763377314; c=relaxed/simple;
	bh=RUuiQKMns3L0MXi8c0THpZgAz9JCHv8jeZvCEMsmp3M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rmJQuzSDNrAvcxx/0f0w/MFxz9wCDxTDIw2v8SwqyqwZREqm8dWcx6DYMUFiq1R+JAByUt3+WqWUYHLYI0OzUNircOOIF7U5H5bIb2hK65Ag7gdxPkGqvKmpUqzlfxTKymPiTdzrBYR4tgfx8Z7/Kf7qbDbw2lgYMJeakqG+vlU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gZsD0U4B; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gZsD0U4B"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763377312; x=1794913312;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=RUuiQKMns3L0MXi8c0THpZgAz9JCHv8jeZvCEMsmp3M=;
  b=gZsD0U4BIF6ftEaliQDEurYZKxB6OABNU1aV9yZVybfOCUPt51SYu75c
   PmJ9CLLreI+dU38nMKp0z8LfE8UMfhxep+jWhmowsJAAq/yh7YyW46YNu
   kCkuYdOm2UEKxEvuPCNtKrFscd6rH7Ba3LVb7Vcu+JDsBByjFHYkqWzYk
   gQkt0tDkp0LF8mlcnw3nAdsGFVqycznS+vqL+Aiybp/AuS4R4loqcew4I
   oQ9zuIiO18RT9pccuL34Y5lVZ/xPj+HINO60iI///GF2yOkVSQAUfxScK
   NkigBbgMCvD3MyhlnlnQHf9cjKO1c112i5PKr6ITRlo+jjITb0VDG0qVA
   A==;
X-CSE-ConnectionGUID: YMWIO0q7TveuTnWQ1FCMXQ==
X-CSE-MsgGUID: 19hOZswsQpmgq03OfvpzWQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11615"; a="90850842"
X-IronPort-AV: E=Sophos;i="6.19,311,1754982000"; 
   d="scan'208";a="90850842"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Nov 2025 03:01:51 -0800
X-CSE-ConnectionGUID: dP6+o0O2QbG7G2yZcXwEmQ==
X-CSE-MsgGUID: mpLGhJLkSyW2FpVi3J8x7w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,311,1754982000"; 
   d="scan'208";a="221315699"
Received: from lkp-server01.sh.intel.com (HELO adf6d29aa8d9) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 17 Nov 2025 03:01:46 -0800
Received: from kbuild by adf6d29aa8d9 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vKwzQ-0000SV-2B;
	Mon, 17 Nov 2025 11:01:44 +0000
Date: Mon, 17 Nov 2025 19:00:58 +0800
From: kernel test robot <lkp@intel.com>
To: Pingfan Liu <piliu@redhat.com>, linux-kernel@vger.kernel.org
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Pingfan Liu <piliu@redhat.com>, Waiman Long <longman@redhat.com>,
	Chen Ridong <chenridong@huaweicloud.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Juri Lelli <juri.lelli@redhat.com>,
	Pierre Gondois <pierre.gondois@arm.com>,
	Ingo Molnar <mingo@redhat.com>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Ben Segall <bsegall@google.com>, Mel Gorman <mgorman@suse.de>,
	Valentin Schneider <vschneid@redhat.com>, Tejun Heo <tj@kernel.org>,
	Johannes Weiner <hannes@cmpxchg.org>, mkoutny@suse.com
Subject: Re: [PATCHv6 2/2] sched/deadline: Walk up cpuset hierarchy to decide
 root domain when hot-unplug
Message-ID: <202511171845.tuNk3Eb6-lkp@intel.com>
References: <20251117092732.16419-3-piliu@redhat.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251117092732.16419-3-piliu@redhat.com>

Hi Pingfan,

kernel test robot noticed the following build errors:

[auto build test ERROR on tj-cgroup/for-next]
[also build test ERROR on tip/sched/core peterz-queue/sched/core linus/master v6.18-rc6 next-20251114]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Pingfan-Liu/cgroup-cpuset-Introduce-cpuset_cpus_allowed_locked/20251117-173841
base:   https://git.kernel.org/pub/scm/linux/kernel/git/tj/cgroup.git for-next
patch link:    https://lore.kernel.org/r/20251117092732.16419-3-piliu%40redhat.com
patch subject: [PATCHv6 2/2] sched/deadline: Walk up cpuset hierarchy to decide root domain when hot-unplug
config: x86_64-allnoconfig (https://download.01.org/0day-ci/archive/20251117/202511171845.tuNk3Eb6-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251117/202511171845.tuNk3Eb6-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511171845.tuNk3Eb6-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from kernel/sched/build_policy.c:58:
>> kernel/sched/deadline.c:2937:2: error: call to undeclared function 'cpuset_cpus_allowed_locked'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    2937 |         cpuset_cpus_allowed_locked(p, cpus);
         |         ^
   1 error generated.


vim +/cpuset_cpus_allowed_locked +2937 kernel/sched/deadline.c

  2910	
  2911	/*
  2912	 * This function always returns a non-empty bitmap in @cpus. This is because
  2913	 * if a root domain has reserved bandwidth for DL tasks, the DL bandwidth
  2914	 * check will prevent CPU hotplug from deactivating all CPUs in that domain.
  2915	 */
  2916	static void dl_get_task_effective_cpus(struct task_struct *p, struct cpumask *cpus)
  2917	{
  2918		const struct cpumask *hk_msk;
  2919	
  2920		hk_msk = housekeeping_cpumask(HK_TYPE_DOMAIN);
  2921		if (housekeeping_enabled(HK_TYPE_DOMAIN)) {
  2922			if (!cpumask_intersects(p->cpus_ptr, hk_msk)) {
  2923				/*
  2924				 * CPUs isolated by isolcpu="domain" always belong to
  2925				 * def_root_domain.
  2926				 */
  2927				cpumask_andnot(cpus, cpu_active_mask, hk_msk);
  2928				return;
  2929			}
  2930		}
  2931	
  2932		/*
  2933		 * If a root domain holds a DL task, it must have active CPUs. So
  2934		 * active CPUs can always be found by walking up the task's cpuset
  2935		 * hierarchy up to the partition root.
  2936		 */
> 2937		cpuset_cpus_allowed_locked(p, cpus);
  2938	}
  2939	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
