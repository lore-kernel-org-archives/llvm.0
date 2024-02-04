Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BF9610A19;
	Sun,  4 Feb 2024 08:14:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707034466; cv=none; b=SVFupx8grWpSFUPrl7vCELtig1QkoOZ8h+mXG+YcmZCuY0pa94Tw9K6Z229L6xbNPXyY4sBT+Zr8URKR6cNxolg97E6+PVwKb/pssr775w0YaEoDliUwltleICiNix2ATBIEJdmQsv+3gi1aEUuv0yd+hY4HdSzcTDZQjLucAyg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707034466; c=relaxed/simple;
	bh=C3qfc5ALTWzUYWNVrxnzlA5PHdtrABr+imII4/V5rbw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=mR06DvWhxAk2CoroCr7uGpb/mIIZRQo4GBWJYpXOGYKk77RE6EpL0k3mZFLr9VR6nL0CGGda+v2VXRU2UvVE4UL5P5z8yzv+eqtH5S9xGdqHB9OqG4fHlMElCEoKEsxm656pP+H09UbtlcUxlrzXman0tkAQRR+YT3/okV7fBuk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mbDo8qZ1; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mbDo8qZ1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1707034464; x=1738570464;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=C3qfc5ALTWzUYWNVrxnzlA5PHdtrABr+imII4/V5rbw=;
  b=mbDo8qZ1Nk8cyx/T5q7aORdDujRF6Uni0BEGWOGwDPsfOeAa6fR6nspo
   Pbj4VIutrbQx3M1xMASIqKV5iL/bpicZZ5Rb646sq7KtrTo9BUYcxk3bx
   Y9FzM0qgpOASVKyT7Ah7nzvY5SuiRDUt1FBQehdhbPdOENaAvKiSkeghO
   xLRZZpSdU2VmtMhtpk92ZGIZ0An72ibxqusc0+7bEo4Siv+nEj+YM9tTL
   WocT7EjbuzSK2hFWbFbc57cuM7hB18ej78UYiQNmO6o46uWutVPtF20YG
   RJgj2V/VVQediEVBPPq6rTKWUZEnMv26R/uLN3T4f1t+YPUnjUK9U8qBL
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10973"; a="292333"
X-IronPort-AV: E=Sophos;i="6.05,242,1701158400"; 
   d="scan'208";a="292333"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Feb 2024 00:14:24 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,242,1701158400"; 
   d="scan'208";a="5046958"
Received: from lkp-server02.sh.intel.com (HELO 59f4f4cd5935) ([10.239.97.151])
  by orviesa005.jf.intel.com with ESMTP; 04 Feb 2024 00:14:22 -0800
Received: from kbuild by 59f4f4cd5935 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rWXcs-00069U-2I;
	Sun, 04 Feb 2024 08:13:31 +0000
Date: Sun, 4 Feb 2024 16:12:23 +0800
From: kernel test robot <lkp@intel.com>
To: Qais Yousef <qais.yousef@arm.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [qais-yousef:overutilized-affinity 2/2] kernel/sched/fair.c:12694:2:
 error: call to undeclared function 'set_task_max_allowed_capacity'; ISO C99
 and later do not support implicit function declarations
Message-ID: <202402041649.mdKgSRsZ-lkp@intel.com>
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
commit: 3c515086c41e884b65c919541cc1bb563be80ed6 [2/2] sched/fair: Check a task has a fitting cpu when updating misfit
config: i386-randconfig-001-20240204 (https://download.01.org/0day-ci/archive/20240204/202402041649.mdKgSRsZ-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240204/202402041649.mdKgSRsZ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202402041649.mdKgSRsZ-lkp@intel.com/

All errors (new ones prefixed by >>):

>> kernel/sched/fair.c:12694:2: error: call to undeclared function 'set_task_max_allowed_capacity'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    12694 |         set_task_max_allowed_capacity(p);
          |         ^
   kernel/sched/fair.c:12819:2: error: call to undeclared function 'set_task_max_allowed_capacity'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    12819 |         set_task_max_allowed_capacity(p);
          |         ^
   2 errors generated.


vim +/set_task_max_allowed_capacity +12694 kernel/sched/fair.c

 12678	
 12679	/*
 12680	 * called on fork with the child task as argument from the parent's context
 12681	 *  - child not yet on the tasklist
 12682	 *  - preemption disabled
 12683	 */
 12684	static void task_fork_fair(struct task_struct *p)
 12685	{
 12686		struct sched_entity *se = &p->se, *curr;
 12687		struct cfs_rq *cfs_rq;
 12688		struct rq *rq = this_rq();
 12689		struct rq_flags rf;
 12690	
 12691		rq_lock(rq, &rf);
 12692		update_rq_clock(rq);
 12693	
 12694		set_task_max_allowed_capacity(p);
 12695	
 12696		cfs_rq = task_cfs_rq(current);
 12697		curr = cfs_rq->curr;
 12698		if (curr)
 12699			update_curr(cfs_rq);
 12700		place_entity(cfs_rq, se, ENQUEUE_INITIAL);
 12701		rq_unlock(rq, &rf);
 12702	}
 12703	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
