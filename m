Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FB5E33E37A;
	Tue,  2 Jun 2026 02:21:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780366885; cv=none; b=MGLx7hwyY1ONWPydfqVC9dGl5Bg1HWwSh+cHYETaobykLHpJbcml+5WxzNVSynaXdm23bBx3Tk2nwIv1LerNPzRI7xXZJ6EEmbJ23QKOEwh4yb4lFBIRsl6OTTUDu4I8bShu4LieYftFutsjz17VGIVe7H2Xb5oVW8/VhdgZvH0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780366885; c=relaxed/simple;
	bh=c2+SViuNjksxMtE1VcAPh1IEUFSJvUeNCCC+NtP5vQ0=;
	h=Date:From:To:Cc:Subject:Message-ID; b=baFG1Q3EaDntBr8ja/IJeZjJUdDosuaaDDdzD6xs3JxJl4QVdMT1v/rru339RNluuntqtyWs93FPBU2wS/gZlKd+84g+nb35DROrpYRva75eR5JjtxGcedov9MMNHjZVgbOdpdG8fCMnLJIHdQAD1MwQrEDf76x/UlzLdh1Dhf4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=chLgXfDE; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="chLgXfDE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1780366884; x=1811902884;
  h=date:from:to:cc:subject:message-id;
  bh=c2+SViuNjksxMtE1VcAPh1IEUFSJvUeNCCC+NtP5vQ0=;
  b=chLgXfDEcLrHO++uDB9eA32rOpQlb5uXL4G+aeJ9Opr+KHJeebZRpTDm
   54KBAl7hTeyfJmsHQyYXdIO4xV5xHC/+wH42/kpTExBFhSBWGs4E1RQ60
   oo5gKwd4TGfWlv0myXqd672K07Pv6CM02At7VfF2w7phflQ2E0op3cetp
   vFkys80vXaUAq7Zcok7ll3KMNsOmyoReRWWIqbvWUG+zsstNzFL9OqPQD
   i0bli1VwVVe1ewQA4l21Dn1Gd7ILWURinJKUOQzkSVFQisi4gpN7uuL71
   opQzKEEGOgf1/qMevSRcoRpd2xORFleqWSVn9oyyKKWeQsn//jJ/AQMPY
   A==;
X-CSE-ConnectionGUID: qLeIiL7lTxOhlWrWrR8qkA==
X-CSE-MsgGUID: PoC+JFa9QUmmoVbSY5K7ug==
X-IronPort-AV: E=McAfee;i="6800,10657,11804"; a="91446572"
X-IronPort-AV: E=Sophos;i="6.24,182,1774335600"; 
   d="scan'208";a="91446572"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Jun 2026 19:21:24 -0700
X-CSE-ConnectionGUID: SlxvEZ+hTrmO038VyK4e/A==
X-CSE-MsgGUID: ceeDOTK7SsKSaWFkzlf2hA==
X-ExtLoop1: 1
Received: from igk-lkp-server01.igk.intel.com (HELO 892db79562d4) ([10.211.93.152])
  by fmviesa003.fm.intel.com with ESMTP; 01 Jun 2026 19:21:22 -0700
Received: from kbuild by 892db79562d4 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wUEkq-000000001if-2ILW;
	Tue, 02 Jun 2026 02:21:20 +0000
Date: Tue, 02 Jun 2026 04:20:51 +0200
From: kernel test robot <lkp@intel.com>
To: K Prateek Nayak <kprateek.nayak@amd.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 Peter Zijlstra <peterz@infradead.org>
Subject: [peterz-queue:sched/core 53/55] kernel/sched/core.c:9862:19:
 error: too few arguments to function call, single argument 'rq' was not
 specified
Message-ID: <202606020432.6P6cOrOj-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/peterz/queue.git sched/core
head:   3a9f55cc6febc28a79812ccea577e49e6292c272
commit: f01680da9d51010caa60b7f534bbae7eeed904d3 [53/55] sched/fair: Call update_curr() before unthrottling the hierarchy
config: x86_64-rhel-9.4-rust (https://download.01.org/0day-ci/archive/20260602/202606020432.6P6cOrOj-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
rustc: rustc 1.88.0 (6b00bc388 2025-06-23)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260602/202606020432.6P6cOrOj-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202606020432.6P6cOrOj-lkp@intel.com/

All errors (new ones prefixed by >>):

>> kernel/sched/core.c:9862:19: error: too few arguments to function call, single argument 'rq' was not specified
    9862 |                 update_rq_clock();
         |                 ~~~~~~~~~~~~~~~ ^
   kernel/sched/core.c:860:6: note: 'update_rq_clock' declared here
     860 | void update_rq_clock(struct rq *rq)
         |      ^               ~~~~~~~~~~~~~
   1 error generated.


vim +/rq +9862 kernel/sched/core.c

  9805	
  9806	static int tg_set_cfs_bandwidth(struct task_group *tg,
  9807					u64 period_us, u64 quota_us, u64 burst_us)
  9808	{
  9809		int i, ret = 0, runtime_enabled, runtime_was_enabled;
  9810		struct cfs_bandwidth *cfs_b = &tg->cfs_bandwidth;
  9811		u64 period, quota, burst;
  9812	
  9813		period = (u64)period_us * NSEC_PER_USEC;
  9814	
  9815		if (quota_us == RUNTIME_INF)
  9816			quota = RUNTIME_INF;
  9817		else
  9818			quota = (u64)quota_us * NSEC_PER_USEC;
  9819	
  9820		burst = (u64)burst_us * NSEC_PER_USEC;
  9821	
  9822		/*
  9823		 * Prevent race between setting of cfs_rq->runtime_enabled and
  9824		 * unthrottle_offline_cfs_rqs().
  9825		 */
  9826		guard(cpus_read_lock)();
  9827		guard(mutex)(&cfs_constraints_mutex);
  9828	
  9829		ret = __cfs_schedulable(tg, period, quota);
  9830		if (ret)
  9831			return ret;
  9832	
  9833		runtime_enabled = quota != RUNTIME_INF;
  9834		runtime_was_enabled = cfs_b->quota != RUNTIME_INF;
  9835		/*
  9836		 * If we need to toggle cfs_bandwidth_used, off->on must occur
  9837		 * before making related changes, and on->off must occur afterwards
  9838		 */
  9839		if (runtime_enabled && !runtime_was_enabled)
  9840			cfs_bandwidth_usage_inc();
  9841	
  9842		scoped_guard (raw_spinlock_irq, &cfs_b->lock) {
  9843			cfs_b->period = ns_to_ktime(period);
  9844			cfs_b->quota = quota;
  9845			cfs_b->burst = burst;
  9846	
  9847			__refill_cfs_bandwidth_runtime(cfs_b);
  9848	
  9849			/*
  9850			 * Restart the period timer (if active) to handle new
  9851			 * period expiry:
  9852			 */
  9853			if (runtime_enabled)
  9854				start_cfs_bandwidth(cfs_b);
  9855		}
  9856	
  9857		for_each_online_cpu(i) {
  9858			struct cfs_rq *cfs_rq = tg_cfs_rq(tg, i);
  9859			struct rq *rq = cfs_rq->rq;
  9860	
  9861			guard(rq_lock_irq)(rq);
> 9862			update_rq_clock();
  9863			cfs_rq->runtime_enabled = runtime_enabled;
  9864			cfs_rq->runtime_remaining = 1;
  9865	
  9866			if (cfs_rq->throttled)
  9867				unthrottle_cfs_rq(cfs_rq);
  9868		}
  9869	
  9870		if (runtime_was_enabled && !runtime_enabled)
  9871			cfs_bandwidth_usage_dec();
  9872	
  9873		return 0;
  9874	}
  9875	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
