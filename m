Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98A3124CEF1;
	Thu,  3 Apr 2025 14:50:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743691822; cv=none; b=r61g/uqA5BbF5Hn6D0eLVKi7LHzK7c+2g/5LSCxqy0AqEUeG7lxOYlbWizPNg/OracPovJtavHteXOLYVKSakLDQMRY+Fh4EMUh9p7jweKGmbg+8JRFG6G6HBqugdBsTObq8w9tt1pp/hlzE1piKgqCkMLNRbuBWiegwgCWr57E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743691822; c=relaxed/simple;
	bh=0cSuYs4eWbwP+NTo25/5BrDTr04nrpKylOwXwDlBZ2Q=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=b7CjsDumlqN8ue9e4wJD6xkFStv5jmMo5W6jE9pMKmtVGTIEVOJvE1/P6Bc5CCW2BP+yjA+Nmiaob83e5lqVfJIXuh4SAsEvzaHQGrVuI+q2p6bYHE0HoMqcQNql8t71KGCerJsskvMzyaqmSFJXuti+M9nOd70wGcN5sDiXXaQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=akONfE6F; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="akONfE6F"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1743691821; x=1775227821;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=0cSuYs4eWbwP+NTo25/5BrDTr04nrpKylOwXwDlBZ2Q=;
  b=akONfE6FXc7HVs5TLu2AIvfJfrxrwhnnf7nXrVDiyAtqG/aytVyYh+h4
   tNPbCBYIIrwKGy4PDRUqY7mOTM6G6yuyxAJ+Lja5aOQesaK3YNDdysRCf
   CjmVvh1rZMOc5d7HwIX76BkEeXC5BOcpg0yoQJEI6Eu497idnGEO0yn1v
   dLaAyUfRye1PMQ/wrrwTlRk99kOtc9KWP6/uhM6+t8fWQrtYiv19yVigI
   eSIgHPVCQZf82wHwGQ92iD1y4fyfl/fXBcJBMTGQZcGWEJZJHIN7MSf3Q
   i7q5N9AP2tz2EtNjoZY+BfJVgz9rqzLHpYUVAvb8Ys+VieeLNxY+WldPn
   g==;
X-CSE-ConnectionGUID: +mGnLQuOTeSPiORSj0k7QQ==
X-CSE-MsgGUID: avj3ImVhSfieayRJ4ZrZ+w==
X-IronPort-AV: E=McAfee;i="6700,10204,11393"; a="45121290"
X-IronPort-AV: E=Sophos;i="6.15,184,1739865600"; 
   d="scan'208";a="45121290"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Apr 2025 07:50:21 -0700
X-CSE-ConnectionGUID: XpeamoVUTEmc3IFLOtzJ3A==
X-CSE-MsgGUID: /mPo2hJTTGGji6z+42vTUQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,184,1739865600"; 
   d="scan'208";a="132009557"
Received: from lkp-server01.sh.intel.com (HELO b207828170a5) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 03 Apr 2025 07:50:18 -0700
Received: from kbuild by b207828170a5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u0LtY-0000Ti-23;
	Thu, 03 Apr 2025 14:50:16 +0000
Date: Thu, 3 Apr 2025 22:50:11 +0800
From: kernel test robot <lkp@intel.com>
To: Peter Zijlstra <peterz@infradead.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [peterz-queue:sched/hrtick 1/6] kernel/sched/fair.c:6813:10: error:
 call to undeclared function 'cpu_util_dl'; ISO C99 and later do not support
 implicit function declarations
Message-ID: <202504032231.tANMXCtr-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/peterz/queue.git sched/hrtick
head:   7ca06092f4a1b8dfd501b5cb1749854a13d5a898
commit: deebcd729d011e54806d9026965fcb0c18111129 [1/6] sched/eevdf: Fix HRTICK duration
config: hexagon-randconfig-002-20250403 (https://download.01.org/0day-ci/archive/20250403/202504032231.tANMXCtr-lkp@intel.com/config)
compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project 7eccafc3c84606587a175c0a8c1ebea6e4fb21cd)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250403/202504032231.tANMXCtr-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202504032231.tANMXCtr-lkp@intel.com/

All errors (new ones prefixed by >>):

>> kernel/sched/fair.c:6813:10: error: call to undeclared function 'cpu_util_dl'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    6813 |         util += cpu_util_dl(rq);
         |                 ^
   kernel/sched/fair.c:6813:10: note: did you mean 'cpu_util_irq'?
   kernel/sched/sched.h:3486:29: note: 'cpu_util_irq' declared here
    3486 | static inline unsigned long cpu_util_irq(struct rq *rq)
         |                             ^
>> kernel/sched/fair.c:6814:10: error: call to undeclared function 'cpu_util_rt'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    6814 |         util += cpu_util_rt(rq);
         |                 ^
   2 errors generated.


vim +/cpu_util_dl +6813 kernel/sched/fair.c

  6780	
  6781	/**************************************************
  6782	 * CFS operations on tasks:
  6783	 */
  6784	
  6785	#ifdef CONFIG_SCHED_HRTICK
  6786	static void hrtick_start_fair(struct rq *rq, struct task_struct *p)
  6787	{
  6788		struct sched_entity *se = &p->se;
  6789		unsigned long scale = 1024;
  6790		unsigned long util = 0;
  6791		u64 vdelta;
  6792		u64 delta;
  6793	
  6794		WARN_ON_ONCE(task_rq(p) != rq);
  6795	
  6796		if (rq->cfs.h_nr_queued <= 1)
  6797			return;
  6798	
  6799		/*
  6800		 * Compute time until virtual deadline
  6801		 */
  6802		vdelta = se->deadline - se->vruntime;
  6803		if ((s64)vdelta < 0) {
  6804			if (task_current_donor(rq, p))
  6805				resched_curr(rq);
  6806			return;
  6807		}
  6808		delta = (se->load.weight * vdelta) / NICE_0_LOAD;
  6809	
  6810		/*
  6811		 * Correct for instantaneous load of other classes.
  6812		 */
> 6813		util += cpu_util_dl(rq);
> 6814		util += cpu_util_rt(rq);
  6815		util += cpu_util_irq(rq);
  6816		if (util && util < 1024) {
  6817			scale *= 1024;
  6818			scale /= (1024 - util);
  6819		}
  6820	
  6821		hrtick_start(rq, (scale * delta) / 1024);
  6822	}
  6823	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
