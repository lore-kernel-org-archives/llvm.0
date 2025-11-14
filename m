Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 175CC220F5D;
	Fri, 14 Nov 2025 06:48:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763102884; cv=none; b=fXcO+65gZ5RQwdlRc2EjVFZSjr+Y3H5YpA/3Z6QnBeHA2SkHpdQ+GRJ4vWGmTiMJYbKthTwgAuek1KzSF2sR5YxNvxUKMKKdcgO0rr8RTV/7t07U5FzgAaXvtcm1skcRCxaTcvTEei4+XpG548lWAnAtKuwI2go/cDTYcsZxmZw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763102884; c=relaxed/simple;
	bh=7kyh+6I6Oh4ZOts3YxSq4YLYKrEateEj8svhoz3xPVE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=j6Mr/oH05LLlXAw1DvkQjkmr2kZrB43wJIPreTmn2n9HO490m6I+8e/Waci8CMT2BuP5v4m4mUYllVqGMIuFxp02a8Fcfhnw/HnG+z5dJp5ZAofDK+cCJCHgdjPfkrC7h2LlpJpZt2x0Z0IvkrzdOB1YVU+V0YouSzNuF9ZyFfE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QFhQKRgd; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QFhQKRgd"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763102883; x=1794638883;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=7kyh+6I6Oh4ZOts3YxSq4YLYKrEateEj8svhoz3xPVE=;
  b=QFhQKRgdvZQZkLtGGGSTz6Wylzp0Nn+3eYEC30mII5+MtQIeyCrOGj5a
   btopDW4I0iNSeiKpTdMckw3OBnWXIyCGah6zyHM5T0QHO2I0FTdf9Me1x
   ndKtrNkUOmwqn5iD/N6BEImItboS7EsrLXdxisgFr8TCua39ofpq/fBUX
   ToYvXWbrVj8DMZoiq3wrUmTDMh1v3ro76hRGJ5oHeD5kDZhNJaFJn24mX
   n1ICGtpmEGwO4e3y24/u6InqSv9gQ7A7WnNDiNRzsQQ37DdiTzQali7cn
   9TZEwC8fpmvwTAfRJFfDiviM2Apj5X0Ee9HK8rcamij26sdS/eGSVo6iK
   w==;
X-CSE-ConnectionGUID: ssD69OC9TXKhJiZjq2El4w==
X-CSE-MsgGUID: r19ZiCmmTPmpkGOrTWYGEA==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="65132778"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="65132778"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Nov 2025 22:48:03 -0800
X-CSE-ConnectionGUID: 37HgpYzCQU6lADhFM6AdIQ==
X-CSE-MsgGUID: w2FhyoCxTUCpPPfVwFrQDA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,304,1754982000"; 
   d="scan'208";a="189554980"
Received: from lkp-server01.sh.intel.com (HELO 7b01c990427b) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 13 Nov 2025 22:47:59 -0800
Received: from kbuild by 7b01c990427b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vJnbB-0006Fh-16;
	Fri, 14 Nov 2025 06:47:57 +0000
Date: Fri, 14 Nov 2025 14:47:39 +0800
From: kernel test robot <lkp@intel.com>
To: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>,
	linux-kernel@vger.kernel.org
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	kernel-dev@igalia.com, Tvrtko Ursulin <tvrtko.ursulin@igalia.com>,
	Johannes Weiner <hannes@cmpxchg.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Peter Ziljstra <peterz@infradead.org>
Subject: Re: [PATCH] sched/psi: Streamline the flow in psi_group_change
Message-ID: <202511141344.rntAQaRB-lkp@intel.com>
References: <20251113122254.40445-1-tvrtko.ursulin@igalia.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251113122254.40445-1-tvrtko.ursulin@igalia.com>

Hi Tvrtko,

kernel test robot noticed the following build warnings:

[auto build test WARNING on tip/sched/core]
[also build test WARNING on linus/master v6.18-rc5 next-20251113]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Tvrtko-Ursulin/sched-psi-Streamline-the-flow-in-psi_group_change/20251113-203009
base:   tip/sched/core
patch link:    https://lore.kernel.org/r/20251113122254.40445-1-tvrtko.ursulin%40igalia.com
patch subject: [PATCH] sched/psi: Streamline the flow in psi_group_change
config: arm-randconfig-003-20251114 (https://download.01.org/0day-ci/archive/20251114/202511141344.rntAQaRB-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 0bba1e76581bad04e7d7f09f5115ae5e2989e0d9)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251114/202511141344.rntAQaRB-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511141344.rntAQaRB-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from kernel/sched/build_utility.c:93:
>> kernel/sched/psi.c:855:42: warning: variable 'state_mask' is uninitialized when used here [-Wuninitialized]
     855 |         state_mask = test_states(groupc->tasks, state_mask);
         |                                                 ^~~~~~~~~~
   kernel/sched/psi.c:802:16: note: initialize the variable 'state_mask' to silence this warning
     802 |         u32 state_mask;
         |                       ^
         |                        = 0
   1 warning generated.


vim +/state_mask +855 kernel/sched/psi.c

eb414681d5a07d Johannes Weiner    2018-10-26  792  
570c8efd5eb79c Peter Zijlstra     2025-05-23  793  #define for_each_group(iter, group) \
570c8efd5eb79c Peter Zijlstra     2025-05-23  794  	for (typeof(group) iter = group; iter; iter = iter->parent)
570c8efd5eb79c Peter Zijlstra     2025-05-23  795  
36b238d5717279 Johannes Weiner    2020-03-16  796  static void psi_group_change(struct psi_group *group, int cpu,
3840cbe24cf060 Johannes Weiner    2024-10-03  797  			     unsigned int clear, unsigned int set,
570c8efd5eb79c Peter Zijlstra     2025-05-23  798  			     u64 now, bool wake_clock)
eb414681d5a07d Johannes Weiner    2018-10-26  799  {
eb414681d5a07d Johannes Weiner    2018-10-26  800  	struct psi_group_cpu *groupc;
c6ccdabec91131 Tvrtko Ursulin     2025-11-13  801  	unsigned long t, m;
71dbdde7914d32 Johannes Weiner    2022-08-26  802  	u32 state_mask;
eb414681d5a07d Johannes Weiner    2018-10-26  803  
ddae0ca2a8fe12 John Stultz        2024-06-18  804  	lockdep_assert_rq_held(cpu_rq(cpu));
eb414681d5a07d Johannes Weiner    2018-10-26  805  	groupc = per_cpu_ptr(group->pcpu, cpu);
eb414681d5a07d Johannes Weiner    2018-10-26  806  
71dbdde7914d32 Johannes Weiner    2022-08-26  807  	/*
c6ccdabec91131 Tvrtko Ursulin     2025-11-13  808  	 * TSK_ONCPU does not have a corresponding task count - it's just a
c6ccdabec91131 Tvrtko Ursulin     2025-11-13  809  	 * boolean flag directly encoded in the state mask. Clear, set, or carry
c6ccdabec91131 Tvrtko Ursulin     2025-11-13  810  	 * the current state if no changes are requested.
c6ccdabec91131 Tvrtko Ursulin     2025-11-13  811  	 *
c6ccdabec91131 Tvrtko Ursulin     2025-11-13  812  	 * The rest of the state mask is calculated based on the task counts.
c6ccdabec91131 Tvrtko Ursulin     2025-11-13  813  	 * Update those first, then construct the mask.
71dbdde7914d32 Johannes Weiner    2022-08-26  814  	 */
c6ccdabec91131 Tvrtko Ursulin     2025-11-13  815  	m = clear;
c6ccdabec91131 Tvrtko Ursulin     2025-11-13  816  	for_each_set_bit(t, &m, ARRAY_SIZE(groupc->tasks)) {
c6ccdabec91131 Tvrtko Ursulin     2025-11-13  817  		if (likely(groupc->tasks[t])) {
9d10a13d1e4c34 Charan Teja Reddy  2021-04-16  818  			groupc->tasks[t]--;
9d10a13d1e4c34 Charan Teja Reddy  2021-04-16  819  		} else if (!psi_bug) {
c6ccdabec91131 Tvrtko Ursulin     2025-11-13  820  			printk_deferred(KERN_ERR "psi: task underflow! cpu=%d t=%lu tasks=[%u %u %u %u] clear=%x set=%x\n",
eb414681d5a07d Johannes Weiner    2018-10-26  821  					cpu, t, groupc->tasks[0],
eb414681d5a07d Johannes Weiner    2018-10-26  822  					groupc->tasks[1], groupc->tasks[2],
71dbdde7914d32 Johannes Weiner    2022-08-26  823  					groupc->tasks[3], clear, set);
eb414681d5a07d Johannes Weiner    2018-10-26  824  			psi_bug = 1;
eb414681d5a07d Johannes Weiner    2018-10-26  825  		}
eb414681d5a07d Johannes Weiner    2018-10-26  826  	}
eb414681d5a07d Johannes Weiner    2018-10-26  827  
c6ccdabec91131 Tvrtko Ursulin     2025-11-13  828  	m = set;
c6ccdabec91131 Tvrtko Ursulin     2025-11-13  829  	for_each_set_bit(t, &m, ARRAY_SIZE(groupc->tasks))
eb414681d5a07d Johannes Weiner    2018-10-26  830  		groupc->tasks[t]++;
eb414681d5a07d Johannes Weiner    2018-10-26  831  
34f26a15611afb Chengming Zhou     2022-09-07  832  	if (!group->enabled) {
34f26a15611afb Chengming Zhou     2022-09-07  833  		/*
34f26a15611afb Chengming Zhou     2022-09-07  834  		 * On the first group change after disabling PSI, conclude
34f26a15611afb Chengming Zhou     2022-09-07  835  		 * the current state and flush its time. This is unlikely
34f26a15611afb Chengming Zhou     2022-09-07  836  		 * to matter to the user, but aggregation (get_recent_times)
34f26a15611afb Chengming Zhou     2022-09-07  837  		 * may have already incorporated the live state into times_prev;
34f26a15611afb Chengming Zhou     2022-09-07  838  		 * avoid a delta sample underflow when PSI is later re-enabled.
34f26a15611afb Chengming Zhou     2022-09-07  839  		 */
34f26a15611afb Chengming Zhou     2022-09-07  840  		if (unlikely(groupc->state_mask & (1 << PSI_NONIDLE)))
34f26a15611afb Chengming Zhou     2022-09-07  841  			record_times(groupc, now);
34f26a15611afb Chengming Zhou     2022-09-07  842  
c6ccdabec91131 Tvrtko Ursulin     2025-11-13  843  		if (unlikely(clear & TSK_ONCPU))
c6ccdabec91131 Tvrtko Ursulin     2025-11-13  844  			state_mask = 0;
c6ccdabec91131 Tvrtko Ursulin     2025-11-13  845  		else if (unlikely(set & TSK_ONCPU))
c6ccdabec91131 Tvrtko Ursulin     2025-11-13  846  			state_mask = PSI_ONCPU;
c6ccdabec91131 Tvrtko Ursulin     2025-11-13  847  		else
c6ccdabec91131 Tvrtko Ursulin     2025-11-13  848  			state_mask = groupc->state_mask & PSI_ONCPU;
c6ccdabec91131 Tvrtko Ursulin     2025-11-13  849  
34f26a15611afb Chengming Zhou     2022-09-07  850  		groupc->state_mask = state_mask;
34f26a15611afb Chengming Zhou     2022-09-07  851  
34f26a15611afb Chengming Zhou     2022-09-07  852  		return;
34f26a15611afb Chengming Zhou     2022-09-07  853  	}
34f26a15611afb Chengming Zhou     2022-09-07  854  
0ec208ce983492 Tvrtko Ursulin     2024-06-25 @855  	state_mask = test_states(groupc->tasks, state_mask);
7fae6c8171d20a Chengming Zhou     2021-03-03  856  
7fae6c8171d20a Chengming Zhou     2021-03-03  857  	/*
7fae6c8171d20a Chengming Zhou     2021-03-03  858  	 * Since we care about lost potential, a memstall is FULL
7fae6c8171d20a Chengming Zhou     2021-03-03  859  	 * when there are no other working tasks, but also when
7fae6c8171d20a Chengming Zhou     2021-03-03  860  	 * the CPU is actively reclaiming and nothing productive
7fae6c8171d20a Chengming Zhou     2021-03-03  861  	 * could run even if it were runnable. So when the current
7fae6c8171d20a Chengming Zhou     2021-03-03  862  	 * task in a cgroup is in_memstall, the corresponding groupc
7fae6c8171d20a Chengming Zhou     2021-03-03  863  	 * on that cpu is in PSI_MEM_FULL state.
7fae6c8171d20a Chengming Zhou     2021-03-03  864  	 */
71dbdde7914d32 Johannes Weiner    2022-08-26  865  	if (unlikely((state_mask & PSI_ONCPU) && cpu_curr(cpu)->in_memstall))
7fae6c8171d20a Chengming Zhou     2021-03-03  866  		state_mask |= (1 << PSI_MEM_FULL);
7fae6c8171d20a Chengming Zhou     2021-03-03  867  
34f26a15611afb Chengming Zhou     2022-09-07  868  	record_times(groupc, now);
34f26a15611afb Chengming Zhou     2022-09-07  869  
33b2d6302abc4c Suren Baghdasaryan 2019-05-14  870  	groupc->state_mask = state_mask;
33b2d6302abc4c Suren Baghdasaryan 2019-05-14  871  
65457b74aa9437 Domenico Cerasuolo 2023-03-30  872  	if (state_mask & group->rtpoll_states)
65457b74aa9437 Domenico Cerasuolo 2023-03-30  873  		psi_schedule_rtpoll_work(group, 1, false);
36b238d5717279 Johannes Weiner    2020-03-16  874  
36b238d5717279 Johannes Weiner    2020-03-16  875  	if (wake_clock && !delayed_work_pending(&group->avgs_work))
36b238d5717279 Johannes Weiner    2020-03-16  876  		schedule_delayed_work(&group->avgs_work, PSI_FREQ);
eb414681d5a07d Johannes Weiner    2018-10-26  877  }
eb414681d5a07d Johannes Weiner    2018-10-26  878  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
