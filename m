Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CECA32C89;
	Sun,  4 Feb 2024 22:29:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.55.52.88
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707085746; cv=none; b=OoV1ogXzYYhkxFKAuJwMd4kNIuB8Zzge1NbBHqdHBdnzkfVOoNUYeWgxEOQdUi50i8Rb2lSXKfMFqiCBCdtWeZmRyY4E2aXbinW8u8aGtR5gDHag5pQ6pFzUFVOJrkGfLFVdxxrOqI1dv9B4gppZQMWn/F1mvcglu/vy5tARDDI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707085746; c=relaxed/simple;
	bh=+baoqDH3V2tKuBuJVVqQztH6/NBDU7gZbPvZr7Tcxk4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=lMxONS27ebLkpkdpnuuLD0epO+QsYvECFtCsgqqTrwj8nj5LX6ZbpR/rWsTp7iVFwQCCJB2M+A/GYYY4HuVzJywDcVLG3TOTcgNHZZoLcKl3aBAqVLPyuInOEuQeR0xoV9pBaEcmjjiKKyftvsLR0+wOFJRIim5Wf5Z4PY8j30w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OT1Jo2lx; arc=none smtp.client-ip=192.55.52.88
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OT1Jo2lx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1707085744; x=1738621744;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=+baoqDH3V2tKuBuJVVqQztH6/NBDU7gZbPvZr7Tcxk4=;
  b=OT1Jo2lxoopCOf0WbijF34c4vdSEQ0bh8j0YZYVlBRxRbvWULwTRRhnD
   iZ71eO1caHBmE2rzIlmCpIfBHsldcl+HN34a2BobvWlC8V/UCZck+ZBZG
   LHMfOhVij/3P1/ZmirllAm/N0l9N911kiZRXOqhUj98szVIp4CWmTKKFZ
   j2Sx645p2FWfJO3KFQxkMaUVpKxHEu7ToLm8JhwcCFQVgG3xcgnWYqia1
   5v+3MDu5aZ5gtqqSxGGi6LvLmeDYwZ+sbXNt6wDiHyz7rXRkh0zaTPN8e
   Henk8Nf2TSNS+0VQbuYlDwjQFNru5RJbC+Ghzo1kbFqcK7LoIHLYMVGZf
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10973"; a="435557463"
X-IronPort-AV: E=Sophos;i="6.05,242,1701158400"; 
   d="scan'208";a="435557463"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Feb 2024 14:29:03 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,242,1701158400"; 
   d="scan'208";a="5176683"
Received: from lkp-server02.sh.intel.com (HELO 59f4f4cd5935) ([10.239.97.151])
  by fmviesa005.fm.intel.com with ESMTP; 04 Feb 2024 14:29:02 -0800
Received: from kbuild by 59f4f4cd5935 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rWkyy-0006jm-0M;
	Sun, 04 Feb 2024 22:29:00 +0000
Date: Mon, 5 Feb 2024 06:28:40 +0800
From: kernel test robot <lkp@intel.com>
To: Qais Yousef <qais.yousef@arm.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [qais-yousef:overutilized-affinity 2/2] kernel/sched/fair.c:12696:2:
 error: implicit declaration of function 'set_task_max_allowed_capacity' is
 invalid in C99
Message-ID: <202402050612.0iRmbaTj-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/qais-yousef/linux overutilized-affinity
head:   22d6e6b5c20133897944454d2ca4924389d2da90
commit: 46bb39f63c39afa78df4d14261068751b3e3d92e [2/2] sched/fair: Check a task has a fitting cpu when updating misfit
config: powerpc-mpc834x_itxgp_defconfig (https://download.01.org/0day-ci/archive/20240205/202402050612.0iRmbaTj-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project.git f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240205/202402050612.0iRmbaTj-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202402050612.0iRmbaTj-lkp@intel.com/

All errors (new ones prefixed by >>):

>> kernel/sched/fair.c:12696:2: error: implicit declaration of function 'set_task_max_allowed_capacity' is invalid in C99 [-Werror,-Wimplicit-function-declaration]
           set_task_max_allowed_capacity(p);
           ^
   kernel/sched/fair.c:12821:2: error: implicit declaration of function 'set_task_max_allowed_capacity' is invalid in C99 [-Werror,-Wimplicit-function-declaration]
           set_task_max_allowed_capacity(p);
           ^
   kernel/sched/fair.c:13152:6: warning: no previous prototype for function 'free_fair_sched_group' [-Wmissing-prototypes]
   void free_fair_sched_group(struct task_group *tg) { }
        ^
   kernel/sched/fair.c:13152:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   void free_fair_sched_group(struct task_group *tg) { }
   ^
   static 
   kernel/sched/fair.c:13154:5: warning: no previous prototype for function 'alloc_fair_sched_group' [-Wmissing-prototypes]
   int alloc_fair_sched_group(struct task_group *tg, struct task_group *parent)
       ^
   kernel/sched/fair.c:13154:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   int alloc_fair_sched_group(struct task_group *tg, struct task_group *parent)
   ^
   static 
   kernel/sched/fair.c:13159:6: warning: no previous prototype for function 'online_fair_sched_group' [-Wmissing-prototypes]
   void online_fair_sched_group(struct task_group *tg) { }
        ^
   kernel/sched/fair.c:13159:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   void online_fair_sched_group(struct task_group *tg) { }
   ^
   static 
   kernel/sched/fair.c:13161:6: warning: no previous prototype for function 'unregister_fair_sched_group' [-Wmissing-prototypes]
   void unregister_fair_sched_group(struct task_group *tg) { }
        ^
   kernel/sched/fair.c:13161:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   void unregister_fair_sched_group(struct task_group *tg) { }
   ^
   static 
   4 warnings and 2 errors generated.


vim +/set_task_max_allowed_capacity +12696 kernel/sched/fair.c

 12680	
 12681	/*
 12682	 * called on fork with the child task as argument from the parent's context
 12683	 *  - child not yet on the tasklist
 12684	 *  - preemption disabled
 12685	 */
 12686	static void task_fork_fair(struct task_struct *p)
 12687	{
 12688		struct sched_entity *se = &p->se, *curr;
 12689		struct cfs_rq *cfs_rq;
 12690		struct rq *rq = this_rq();
 12691		struct rq_flags rf;
 12692	
 12693		rq_lock(rq, &rf);
 12694		update_rq_clock(rq);
 12695	
 12696		set_task_max_allowed_capacity(p);
 12697	
 12698		cfs_rq = task_cfs_rq(current);
 12699		curr = cfs_rq->curr;
 12700		if (curr)
 12701			update_curr(cfs_rq);
 12702		place_entity(cfs_rq, se, ENQUEUE_INITIAL);
 12703		rq_unlock(rq, &rf);
 12704	}
 12705	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
