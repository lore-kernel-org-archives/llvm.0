Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23F44199FAB;
	Sat, 24 May 2025 07:40:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748072435; cv=none; b=iyM20+kypHxnu41mtpNrtAhCmNznXaJlbQkaRhXHrRxeGgnooi2BfnmNLzKdRot1aDvsBdj0cZJ26kEvP2KW8/1y9EdQN2DX8+HF59b0l44QQIRw5UK6wQ9uv/hxH2vF52EX+FEWztcrk+yI0hMOGNpt488UnzI5+ovYml4X4Ac=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748072435; c=relaxed/simple;
	bh=vWim3HEq/CuunO6/mgu5yoYe/wZ6NM3CIcn3snEhLMk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fCnn6/lRG+Pw8PIGOy+B+e9HKknKyYnlIggIffh77SlqKQBLE5YnXM+qLzadmIznYWhdYPC8qpANe/t2LO/otAPwKof7/MkhcOUFq5xlZh373RQZqor2FG56wtaGuUr66kRqfGP/vmRCffkfmP5RqOlPJdNnBWc3VCuguztdgLA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fIiXPp13; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fIiXPp13"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1748072434; x=1779608434;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=vWim3HEq/CuunO6/mgu5yoYe/wZ6NM3CIcn3snEhLMk=;
  b=fIiXPp13bJH+9SbFKRjTcvPkYQo0/eizWkv/ofa3WpbfRJRvvHt/0VH1
   qagAPmtlgH+B0HB18kV2Be9sBTyA4q4/fDng8su05bUiVFsZGij7uKvkw
   mGGvQvYgLCnFz/nfIy7GZL9pZmvqyM4N+VhuzTa8UGm2cXQ/ncO69oPFS
   XbatUv8JulkIbZYnmkBJHU8IXZT+BTOVBLlE7G7IN/6ey+GPcXD4wbkHY
   Hi9KVbYATJM5DGY4NxCByKhdT0xs3/J2CZt5P5ZyNU25bwsh9Q0ag7wiT
   VNsyOBzI25H4dtgnoTRef9nQfIXyDtxV2YU9jDf3+q34NmAujPg7T6gyv
   Q==;
X-CSE-ConnectionGUID: 2ZuG+UWdQGusYqRSRm1s0A==
X-CSE-MsgGUID: /Jj3lHVfReCDLllpwZX/Dw==
X-IronPort-AV: E=McAfee;i="6700,10204,11441"; a="72648244"
X-IronPort-AV: E=Sophos;i="6.15,311,1739865600"; 
   d="scan'208";a="72648244"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 May 2025 00:40:33 -0700
X-CSE-ConnectionGUID: lwyyJkQEQtKxCkEQYbI2bA==
X-CSE-MsgGUID: PCweQVo+Q9CtQt0XtGaNrg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,311,1739865600"; 
   d="scan'208";a="146338255"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 24 May 2025 00:40:31 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uIjUa-000R20-32;
	Sat, 24 May 2025 07:40:28 +0000
Date: Sat, 24 May 2025 15:39:32 +0800
From: kernel test robot <lkp@intel.com>
To: Shrikanth Hegde <sshegde@linux.ibm.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH 4/5] sched/core: Push current task when cpu is parked
Message-ID: <202505241517.5L95fW8h-lkp@intel.com>
References: <20250523181448.3777233-5-sshegde@linux.ibm.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250523181448.3777233-5-sshegde@linux.ibm.com>

Hi Shrikanth,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on tip/sched/core]
[also build test ERROR on powerpc/next powerpc/fixes peterz-queue/sched/core linus/master tip/smp/core v6.15-rc7 next-20250523]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Shrikanth-Hegde/cpumask-Introduce-cpu-parked-mask/20250524-021851
base:   tip/sched/core
patch link:    https://lore.kernel.org/r/20250523181448.3777233-5-sshegde%40linux.ibm.com
patch subject: [RFC PATCH 4/5] sched/core: Push current task when cpu is parked
config: x86_64-allnoconfig (https://download.01.org/0day-ci/archive/20250524/202505241517.5L95fW8h-lkp@intel.com/config)
compiler: clang version 20.1.2 (https://github.com/llvm/llvm-project 58df0ef89dd64126512e4ee27b4ac3fd8ddf6247)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250524/202505241517.5L95fW8h-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505241517.5L95fW8h-lkp@intel.com/

All errors (new ones prefixed by >>):

>> kernel/sched/core.c:5660:6: error: call to undeclared function 'cpu_parked'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    5660 |         if (cpu_parked(cpu))
         |             ^
   kernel/sched/core.c:7667:12: warning: array index -1 is before the beginning of the array [-Warray-bounds]
    7667 |                                        preempt_modes[preempt_dynamic_mode] : "undef",
         |                                        ^             ~~~~~~~~~~~~~~~~~~~~
   kernel/sched/core.c:7642:1: note: array 'preempt_modes' declared here
    7642 | const char *preempt_modes[] = {
         | ^
   1 warning and 1 error generated.


vim +/cpu_parked +5660 kernel/sched/core.c

  5639	
  5640	/*
  5641	 * This function gets called by the timer code, with HZ frequency.
  5642	 * We call it with interrupts disabled.
  5643	 */
  5644	void sched_tick(void)
  5645	{
  5646		int cpu = smp_processor_id();
  5647		struct rq *rq = cpu_rq(cpu);
  5648		/* accounting goes to the donor task */
  5649		struct task_struct *donor;
  5650		struct rq_flags rf;
  5651		unsigned long hw_pressure;
  5652		u64 resched_latency;
  5653	
  5654		if (housekeeping_cpu(cpu, HK_TYPE_KERNEL_NOISE))
  5655			arch_scale_freq_tick();
  5656	
  5657		sched_clock_tick();
  5658	
  5659		/* push the current task out if cpu is parked */
> 5660		if (cpu_parked(cpu))
  5661			push_current_task(rq);
  5662	
  5663		rq_lock(rq, &rf);
  5664		donor = rq->donor;
  5665	
  5666		psi_account_irqtime(rq, donor, NULL);
  5667	
  5668		update_rq_clock(rq);
  5669		hw_pressure = arch_scale_hw_pressure(cpu_of(rq));
  5670		update_hw_load_avg(rq_clock_task(rq), rq, hw_pressure);
  5671	
  5672		if (dynamic_preempt_lazy() && tif_test_bit(TIF_NEED_RESCHED_LAZY))
  5673			resched_curr(rq);
  5674	
  5675		donor->sched_class->task_tick(rq, donor, 0);
  5676		if (sched_feat(LATENCY_WARN))
  5677			resched_latency = cpu_resched_latency(rq);
  5678		calc_global_load_tick(rq);
  5679		sched_core_tick(rq);
  5680		task_tick_mm_cid(rq, donor);
  5681		scx_tick(rq);
  5682	
  5683		rq_unlock(rq, &rf);
  5684	
  5685		if (sched_feat(LATENCY_WARN) && resched_latency)
  5686			resched_latency_warn(cpu, resched_latency);
  5687	
  5688		perf_event_task_tick();
  5689	
  5690		if (donor->flags & PF_WQ_WORKER)
  5691			wq_worker_tick(donor);
  5692	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
