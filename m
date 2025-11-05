Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC2AF3101A3;
	Wed,  5 Nov 2025 17:03:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762362205; cv=none; b=GNq03X3EVMHdsp+iJhKG7bjSUgYkFr9ZJT3bCE3926vMlMyxyp2BcYWcAN07Nb38pT/wITKsCM4kvSzUXcvFn0ygYXBZYi4/C7Xq1a1a6khuB2aULANxoGDGlLS+3xI7VrUmLOzaeEfvrcLHobkTZaA6zCkBtgJShyKYjacWSi0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762362205; c=relaxed/simple;
	bh=6uz+hHxrqzxaxcnh265LgUfoQ/5ByCeht/rVNdwWt5w=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=DgTxdz+FX/WO2SSHBf6WIyugBNNUnJpxKoBdA3d1xDSL8X1GGEvujUJ41ZcpAJqb7g7meVg2mc0wCcXj4hVX/cyROJqCimmerYtH63qKCR/OBqb4ZzKduxjfFS+/FUPcA+lEYs0txtihUuQFEp1BzewdVebKLplg6JTN0j3K2mM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CiGAqwn3; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CiGAqwn3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1762362203; x=1793898203;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=6uz+hHxrqzxaxcnh265LgUfoQ/5ByCeht/rVNdwWt5w=;
  b=CiGAqwn3RLRZUY8Z7KfPIwEdSjjKrq+ghSI62BtG/1MJ1eOlP8fSAmXO
   daBx1Ikac9kkOGEuFC5hpacg4MXzZl3+69S9eACfclr2ArGVULpQmRjuF
   cyxBBklDCQ3U5u9LAPgzldKCTgbynM+slqMOuvagAZgdiaz81Og0HUu7c
   Ntz3sUsqI8la4yM7RUYXaH4pPcnjsT0dfeq2M6Rqs3BOf4eTRMK/UHfou
   GwB9WEx47SbxjjySiP2pDDgaracnTdh0dRNe4CRN1MVXID1mhVR9sKVZ1
   4Qg/6y+dAN7RAXCX9OLBpuUDSTtTKhjwrBlr1u6ECyYHtrMdv6MRc9ukF
   Q==;
X-CSE-ConnectionGUID: BhkZBNIlR8270Fzj4AfMJw==
X-CSE-MsgGUID: dzuA5bFIRgiUugwbRPIKZA==
X-IronPort-AV: E=McAfee;i="6800,10657,11604"; a="64181606"
X-IronPort-AV: E=Sophos;i="6.19,282,1754982000"; 
   d="scan'208";a="64181606"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Nov 2025 09:03:22 -0800
X-CSE-ConnectionGUID: pSQ9JlCCSJajS5avkj4UVg==
X-CSE-MsgGUID: ebWbgNUAQHyzGt8CW9eLLQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,282,1754982000"; 
   d="scan'208";a="186760465"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by orviesa006.jf.intel.com with ESMTP; 05 Nov 2025 09:03:20 -0800
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vGguh-000SuF-1N;
	Wed, 05 Nov 2025 17:03:15 +0000
Date: Thu, 6 Nov 2025 00:55:13 +0800
From: kernel test robot <lkp@intel.com>
To: Peter Zijlstra <peterz@infradead.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [peterz-queue:sched/core 1/2] kernel/sched/fair.c:8973:3: error:
 call to undeclared function 'update_min_vruntime'; ISO C99 and later do not
 support implicit function declarations
Message-ID: <202511060021.VEXgdS4a-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/peterz/queue.git sched/core
head:   6bcca639d45811ed51ccc5db1a47a7b42dee077c
commit: 4df5bbe4a3ab35dc2ca8fca5569d49cfda688417 [1/2] sched/eevdf: Fix min_vruntime vs avg_vruntime
config: x86_64-allnoconfig (https://download.01.org/0day-ci/archive/20251106/202511060021.VEXgdS4a-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251106/202511060021.VEXgdS4a-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511060021.VEXgdS4a-lkp@intel.com/

All errors (new ones prefixed by >>):

>> kernel/sched/fair.c:8973:3: error: call to undeclared function 'update_min_vruntime'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    8973 |                 update_min_vruntime(cfs_rq);
         |                 ^
   kernel/sched/fair.c:8973:3: note: did you mean 'update_zero_vruntime'?
   kernel/sched/fair.c:743:13: note: 'update_zero_vruntime' declared here
     743 | static void update_zero_vruntime(struct cfs_rq *cfs_rq)
         |             ^
   1 error generated.


vim +/update_min_vruntime +8973 kernel/sched/fair.c

bf0f6f24a1ece8 kernel/sched_fair.c Ingo Molnar     2007-07-09  8932  
ac53db596cc08e kernel/sched_fair.c Rik van Riel    2011-02-01  8933  /*
ac53db596cc08e kernel/sched_fair.c Rik van Riel    2011-02-01  8934   * sched_yield() is very simple
ac53db596cc08e kernel/sched_fair.c Rik van Riel    2011-02-01  8935   */
ac53db596cc08e kernel/sched_fair.c Rik van Riel    2011-02-01  8936  static void yield_task_fair(struct rq *rq)
ac53db596cc08e kernel/sched_fair.c Rik van Riel    2011-02-01  8937  {
ac53db596cc08e kernel/sched_fair.c Rik van Riel    2011-02-01  8938  	struct task_struct *curr = rq->curr;
ac53db596cc08e kernel/sched_fair.c Rik van Riel    2011-02-01  8939  	struct cfs_rq *cfs_rq = task_cfs_rq(curr);
ac53db596cc08e kernel/sched_fair.c Rik van Riel    2011-02-01  8940  	struct sched_entity *se = &curr->se;
ac53db596cc08e kernel/sched_fair.c Rik van Riel    2011-02-01  8941  
ac53db596cc08e kernel/sched_fair.c Rik van Riel    2011-02-01  8942  	/*
ac53db596cc08e kernel/sched_fair.c Rik van Riel    2011-02-01  8943  	 * Are we the only task in the tree?
ac53db596cc08e kernel/sched_fair.c Rik van Riel    2011-02-01  8944  	 */
ac53db596cc08e kernel/sched_fair.c Rik van Riel    2011-02-01  8945  	if (unlikely(rq->nr_running == 1))
ac53db596cc08e kernel/sched_fair.c Rik van Riel    2011-02-01  8946  		return;
ac53db596cc08e kernel/sched_fair.c Rik van Riel    2011-02-01  8947  
ac53db596cc08e kernel/sched_fair.c Rik van Riel    2011-02-01  8948  	clear_buddies(cfs_rq, se);
ac53db596cc08e kernel/sched_fair.c Rik van Riel    2011-02-01  8949  
ac53db596cc08e kernel/sched_fair.c Rik van Riel    2011-02-01  8950  	update_rq_clock(rq);
ac53db596cc08e kernel/sched_fair.c Rik van Riel    2011-02-01  8951  	/*
ac53db596cc08e kernel/sched_fair.c Rik van Riel    2011-02-01  8952  	 * Update run-time statistics of the 'current'.
ac53db596cc08e kernel/sched_fair.c Rik van Riel    2011-02-01  8953  	 */
ac53db596cc08e kernel/sched_fair.c Rik van Riel    2011-02-01  8954  	update_curr(cfs_rq);
916671c08b7808 kernel/sched/fair.c Mike Galbraith  2011-11-22  8955  	/*
916671c08b7808 kernel/sched/fair.c Mike Galbraith  2011-11-22  8956  	 * Tell update_rq_clock() that we've just updated,
916671c08b7808 kernel/sched/fair.c Mike Galbraith  2011-11-22  8957  	 * so we don't do microscopic update in schedule()
916671c08b7808 kernel/sched/fair.c Mike Galbraith  2011-11-22  8958  	 * and double the fastpath cost.
916671c08b7808 kernel/sched/fair.c Mike Galbraith  2011-11-22  8959  	 */
adcc8da8859bee kernel/sched/fair.c Davidlohr Bueso 2018-04-04  8960  	rq_clock_skip_update(rq);
ac53db596cc08e kernel/sched_fair.c Rik van Riel    2011-02-01  8961  
79104becf42bae kernel/sched/fair.c Fernand Sieber  2025-09-18  8962  	/*
79104becf42bae kernel/sched/fair.c Fernand Sieber  2025-09-18  8963  	 * Forfeit the remaining vruntime, only if the entity is eligible. This
79104becf42bae kernel/sched/fair.c Fernand Sieber  2025-09-18  8964  	 * condition is necessary because in core scheduling we prefer to run
79104becf42bae kernel/sched/fair.c Fernand Sieber  2025-09-18  8965  	 * ineligible tasks rather than force idling. If this happens we may
79104becf42bae kernel/sched/fair.c Fernand Sieber  2025-09-18  8966  	 * end up in a loop where the core scheduler picks the yielding task,
79104becf42bae kernel/sched/fair.c Fernand Sieber  2025-09-18  8967  	 * which yields immediately again; without the condition the vruntime
79104becf42bae kernel/sched/fair.c Fernand Sieber  2025-09-18  8968  	 * ends up quickly running away.
79104becf42bae kernel/sched/fair.c Fernand Sieber  2025-09-18  8969  	 */
79104becf42bae kernel/sched/fair.c Fernand Sieber  2025-09-18  8970  	if (entity_eligible(cfs_rq, se)) {
79104becf42bae kernel/sched/fair.c Fernand Sieber  2025-09-18  8971  		se->vruntime = se->deadline;
5e963f2bd4654a kernel/sched/fair.c Peter Zijlstra  2023-05-31  8972  		se->deadline += calc_delta_fair(se->slice, se);
79104becf42bae kernel/sched/fair.c Fernand Sieber  2025-09-18 @8973  		update_min_vruntime(cfs_rq);
79104becf42bae kernel/sched/fair.c Fernand Sieber  2025-09-18  8974  	}
ac53db596cc08e kernel/sched_fair.c Rik van Riel    2011-02-01  8975  }
ac53db596cc08e kernel/sched_fair.c Rik van Riel    2011-02-01  8976  

:::::: The code at line 8973 was first introduced by commit
:::::: 79104becf42baeeb4a3f2b106f954b9fc7c10a3c sched/fair: Forfeit vruntime on yield

:::::: TO: Fernand Sieber <sieberf@amazon.com>
:::::: CC: Peter Zijlstra <peterz@infradead.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
