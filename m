Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA2C8241127;
	Sat,  8 Feb 2025 17:53:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739037222; cv=none; b=dZju7zlykmjEmvv3eRI2sm5ZVtUZuclnIqgpHbyeVbYxu4gA/fLbGQIBq8+4Uwgy1gKwIIxYUV8gAPm21heEuiV5pxqta++wznO5oi15kIPmwmc0rASCzdVY+GzgYIw0morXhNf3gEa+8YWRm02eZ23MFsOBAUZLlEgJn24RpZw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739037222; c=relaxed/simple;
	bh=RRtGHFGmLrqisfL3QQ1oJD+cnbzCmTqQ2HO1OS897G4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=pyBcTJVV8Xt/8+wSl4MqrDGpym5qOO1GdSrB33iZ49HNeOodz4fBPzwDKxDJwLs+J4HgcXUvLG5grFf0kdrKGwzUeKjUqNYuaYkkhXzhqcDXk0IX0oE7HoslT7SDbbTtEU5RW4bMcRNUKsc2HcVArpJbGJvuGcBBv/0nmk3kY2E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=d1KE8rka; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="d1KE8rka"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739037221; x=1770573221;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=RRtGHFGmLrqisfL3QQ1oJD+cnbzCmTqQ2HO1OS897G4=;
  b=d1KE8rkaDcyXWISRDB1k4TGlqiLTQsDe0g0gf+nTtTh81Q+uaQKPBOaZ
   Rcs44E65Xwq7e2JLE5r8Phj1ykkg40cEiSuPtXzq0l+ulxAvu90BLQiYO
   p8YqS1BNX4DI4gCjgdsLyBYuUBEmRXwUpddTSMGPI+kAyGnW4zu2T2tRO
   iq+UACUU61FMFVtZwap/VCGPyDDHvLzSErkAMq9Fw8+hUeT9GlzzAeqV6
   CIXyE5w2e3aoagdcSVgOLVAy6FMluBLjvZlw153I+Ym5B1vem9uRDZM4A
   k1bCe2p1VSGGwucggcpIJL5oerizDtZalNg/X9gpeU3VkqWSxBiGp3LMB
   Q==;
X-CSE-ConnectionGUID: QuSxWuK+R5uUXnpxigyvDg==
X-CSE-MsgGUID: HZhcoVO4TCyo7HoMj04XxQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11339"; a="43584793"
X-IronPort-AV: E=Sophos;i="6.13,270,1732608000"; 
   d="scan'208";a="43584793"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Feb 2025 09:53:39 -0800
X-CSE-ConnectionGUID: EVHWD9QmShmHJ5J6U2olQQ==
X-CSE-MsgGUID: H23x5btnSQ2sdXYSV+u/9Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="116747501"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 08 Feb 2025 09:53:37 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tgp1K-0010Rv-21;
	Sat, 08 Feb 2025 17:53:34 +0000
Date: Sun, 9 Feb 2025 01:53:29 +0800
From: kernel test robot <lkp@intel.com>
To: Peter Zijlstra <peterz@infradead.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-kernel@vger.kernel.org, x86@kernel.org
Subject: [tip:sched/urgent 2/2] kernel/sched/fair.c:3785:11: error: no member
 named 'nr_queued' in 'struct cfs_rq'
Message-ID: <202502090144.H79PM2fQ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git sched/urgent
head:   55294004b122c997591d9de8446f5a4c60402805
commit: 55294004b122c997591d9de8446f5a4c60402805 [2/2] sched/fair: Adhere to place_entity() constraints
config: x86_64-allnoconfig (https://download.01.org/0day-ci/archive/20250209/202502090144.H79PM2fQ-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250209/202502090144.H79PM2fQ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502090144.H79PM2fQ-lkp@intel.com/

All errors (new ones prefixed by >>):

>> kernel/sched/fair.c:3785:11: error: no member named 'nr_queued' in 'struct cfs_rq'
    3785 |                 cfs_rq->nr_queued--;
         |                 ~~~~~~  ^
   kernel/sched/fair.c:3816:11: error: no member named 'nr_queued' in 'struct cfs_rq'
    3816 |                 cfs_rq->nr_queued++;
         |                 ~~~~~~  ^
   2 errors generated.


vim +3785 kernel/sched/fair.c

  3773	
  3774	static void reweight_entity(struct cfs_rq *cfs_rq, struct sched_entity *se,
  3775				    unsigned long weight)
  3776	{
  3777		bool curr = cfs_rq->curr == se;
  3778	
  3779		if (se->on_rq) {
  3780			/* commit outstanding execution time */
  3781			update_curr(cfs_rq);
  3782			update_entity_lag(cfs_rq, se);
  3783			se->deadline -= se->vruntime;
  3784			se->rel_deadline = 1;
> 3785			cfs_rq->nr_queued--;
  3786			if (!curr)
  3787				__dequeue_entity(cfs_rq, se);
  3788			update_load_sub(&cfs_rq->load, se->load.weight);
  3789		}
  3790		dequeue_load_avg(cfs_rq, se);
  3791	
  3792		/*
  3793		 * Because we keep se->vlag = V - v_i, while: lag_i = w_i*(V - v_i),
  3794		 * we need to scale se->vlag when w_i changes.
  3795		 */
  3796		se->vlag = div_s64(se->vlag * se->load.weight, weight);
  3797		if (se->rel_deadline)
  3798			se->deadline = div_s64(se->deadline * se->load.weight, weight);
  3799	
  3800		update_load_set(&se->load, weight);
  3801	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
