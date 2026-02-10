Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84A0C30B536;
	Tue, 10 Feb 2026 16:48:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770742133; cv=none; b=lhgddcr8cmMAM8XSTTuHeX0uc9wtm+kroCFSC4VhE7IoO7N9VABt7Vs3Ed/fa8Ce6uE0RxbbCUNM7laJ93U3nKonIl3U2lGDtaSR2C/1xUICJqhU8bKLU4et+xJF+HY6P1+WtK8KT7VRmRI4MYxhjei33U23geS4gBgVrkUBcm0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770742133; c=relaxed/simple;
	bh=kdNxMFE6PwZGO0BEQaRyKBfOGFnaVOqFW1VBpbMc2uw=;
	h=Date:From:To:Cc:Subject:Message-ID; b=bDo05/x1EOPeTGTcJnLiSTvUEkS5ACV3MtDLCrAdOeT4I9qTxD90iiFpxOvIpzfhYwa++Efo5lxse1CiysEmGbUd5MOYmC3cJqpKddEyVAksmqn7aCd3pWm3DTy44xjJJTa92z+YjKp2msAjdbvAHooAvFLDbijCJnwn5POtboc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SbbgUIM4; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SbbgUIM4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1770742132; x=1802278132;
  h=date:from:to:cc:subject:message-id;
  bh=kdNxMFE6PwZGO0BEQaRyKBfOGFnaVOqFW1VBpbMc2uw=;
  b=SbbgUIM4+KBmHW2qH5JVQKlt4WNRiHrlP1h3JHqnUAzL9iHiGup8PPhg
   3ZIXGdeLQXkAzkE66KOq0mvw5EkyjzCIbD3PsQNApdxXQMTXwwpto68tl
   IgeuGp4uSa7JNilwSEIKiY5EuwjrsxcfKGBRikAqgd0GQZZYAUhOsa6WQ
   aPgEgp4W7eeAlXOgEctnzTTrQV9hRHkKNUSbkzRX3lveEOeSiabm4jXLn
   RCG65lx2w/I/6keMJDGoxHeZhBzxdffZoIj+/IpUR3u6pTyUhuO4NUZ3j
   BW3EWAxYn1c/1NKEoQ+cx+rBpyXZ76wO+c3O56nZYoIFjwggxNawL9KP/
   Q==;
X-CSE-ConnectionGUID: r3tasrZtQmWBLbnxMzCG7g==
X-CSE-MsgGUID: FgRLlN6/RKW0GxjaSd65qw==
X-IronPort-AV: E=McAfee;i="6800,10657,11697"; a="89290702"
X-IronPort-AV: E=Sophos;i="6.21,283,1763452800"; 
   d="scan'208";a="89290702"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Feb 2026 08:48:50 -0800
X-CSE-ConnectionGUID: 6Egu1cN2TxipMsxRYd44aw==
X-CSE-MsgGUID: Nrk/ssK9TACgLChMoovJ5Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,283,1763452800"; 
   d="scan'208";a="211009337"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 10 Feb 2026 08:48:48 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vpqus-00000000pDA-1nSX;
	Tue, 10 Feb 2026 16:48:46 +0000
Date: Wed, 11 Feb 2026 00:48:39 +0800
From: kernel test robot <lkp@intel.com>
To: Peter Zijlstra <peterz@infradead.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [peterz-queue:sched/core 19/19] kernel/sched/fair.c:824:35:
 error: use of undeclared identifier 'cfs_rq'
Message-ID: <202602110027.m5vtu490-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/peterz/queue.git sched/core
head:   2457c33520be9ef61c83b8d2308a46f290273ffe
commit: 2457c33520be9ef61c83b8d2308a46f290273ffe [19/19] sched/fair: Revert 6d71a9c61604 ("sched/fair: Fix EEVDF entity placement bug causing scheduling lag")
config: arm-allnoconfig (https://download.01.org/0day-ci/archive/20260211/202602110027.m5vtu490-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 9b8addffa70cee5b2acc5454712d9cf78ce45710)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260211/202602110027.m5vtu490-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602110027.m5vtu490-lkp@intel.com/

All errors (new ones prefixed by >>):

>> kernel/sched/fair.c:824:35: error: use of undeclared identifier 'cfs_rq'
     824 |         u64 max_slice = cfs_rq_max_slice(cfs_rq) + TICK_NSEC;
         |                                          ^~~~~~
   1 error generated.


vim +/cfs_rq +824 kernel/sched/fair.c

b72757d8b39995 Peter Zijlstra 2025-04-22  807  
86bfbb7ce4f67a Peter Zijlstra 2023-05-31  808  /*
86bfbb7ce4f67a Peter Zijlstra 2023-05-31  809   * lag_i = S - s_i = w_i * (V - v_i)
147f3efaa24182 Peter Zijlstra 2023-05-31  810   *
147f3efaa24182 Peter Zijlstra 2023-05-31  811   * However, since V is approximated by the weighted average of all entities it
147f3efaa24182 Peter Zijlstra 2023-05-31  812   * is possible -- by addition/removal/reweight to the tree -- to move V around
147f3efaa24182 Peter Zijlstra 2023-05-31  813   * and end up with a larger lag than we started with.
147f3efaa24182 Peter Zijlstra 2023-05-31  814   *
147f3efaa24182 Peter Zijlstra 2023-05-31  815   * Limit this to either double the slice length with a minimum of TICK_NSEC
147f3efaa24182 Peter Zijlstra 2023-05-31  816   * since that is the timing granularity.
147f3efaa24182 Peter Zijlstra 2023-05-31  817   *
147f3efaa24182 Peter Zijlstra 2023-05-31  818   * EEVDF gives the following limit for a steady state system:
147f3efaa24182 Peter Zijlstra 2023-05-31  819   *
147f3efaa24182 Peter Zijlstra 2023-05-31  820   *   -r_max < lag < max(r_max, q)
86bfbb7ce4f67a Peter Zijlstra 2023-05-31  821   */
2457c33520be9e Peter Zijlstra 2026-01-26  822  static s64 entity_lag(u64 avruntime, struct sched_entity *se)
86bfbb7ce4f67a Peter Zijlstra 2023-05-31  823  {
b72757d8b39995 Peter Zijlstra 2025-04-22 @824  	u64 max_slice = cfs_rq_max_slice(cfs_rq) + TICK_NSEC;
1560d1f6eb6b39 Xuewen Yan     2024-04-22  825  	s64 vlag, limit;
1560d1f6eb6b39 Xuewen Yan     2024-04-22  826  
2457c33520be9e Peter Zijlstra 2026-01-26  827  	vlag = avruntime - se->vruntime;
b72757d8b39995 Peter Zijlstra 2025-04-22  828  	limit = calc_delta_fair(max_slice, se);
6d71a9c6160479 Peter Zijlstra 2025-01-09  829  
2457c33520be9e Peter Zijlstra 2026-01-26  830  	return clamp(vlag, -limit, limit);
2457c33520be9e Peter Zijlstra 2026-01-26  831  }
2457c33520be9e Peter Zijlstra 2026-01-26  832  

:::::: The code at line 824 was first introduced by commit
:::::: b72757d8b39995a91663eec1a0b86ff663eaa80a sched/fair: Fix lag clamp

:::::: TO: Peter Zijlstra <peterz@infradead.org>
:::::: CC: Peter Zijlstra <peterz@infradead.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
