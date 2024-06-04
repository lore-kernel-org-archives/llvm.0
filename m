Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4A2B145A0D;
	Tue,  4 Jun 2024 11:51:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717501882; cv=none; b=UrdA2OcEmlys9nLTerA5FRWwOBEA8TV2dMDo2yMVyi8Ao149yr5gEat9ItjjUGdYEgQqHZGbbTXj1tp8raPhq2zgc9aI8dRpQqyL89veBK6VjvgBA3AoDnyZCF0/vu1vjWzHcoLPamA47sxrHPSbXU+I68w8gOxHi+F9vm7WtbQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717501882; c=relaxed/simple;
	bh=g/DuNSURLT59X1YZFfjWFCVPAO/sd0qv3yyeB9dBkXQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=B0JZC4+av+aL28HWzVMkG9I6nxjQpBhEUa2a07aRM9VY/X1DYDHfGV9Tb58PyCtaOQwDYU6jHB0mLiby1cLsKgGImBALXzY6AVkmMBJOFQVbItfW0uNYdkc/+EYa0eiIvA20XGQQ45Mx2IuVRTnL/Nj/fVojlUCyrdYkXuBhrvg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VlOZ0RWt; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VlOZ0RWt"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1717501881; x=1749037881;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=g/DuNSURLT59X1YZFfjWFCVPAO/sd0qv3yyeB9dBkXQ=;
  b=VlOZ0RWtqtgu4hUlVWyCacXe59DtTto6KqkB5ucbuwOStqyd7DumlLMd
   JGDJLHeyG1cMEmWO+YY4YtiGJTcwRzoVgbBE9fLrrPr3uMXtDXdpmxUSD
   F4kJe56W9H+EULofcCFk7BwqFsU9Ap33XNKWRbKhpWgIQ6g9XxdK+mZEt
   dlfLe/rzedUEVlu8+KJyYc4z7MbjkNqJUwaxDJipNClRL8mdLcqnlr8Qk
   N4GKrnPCa6xvTT5xlMw5Uys2khhNtX4T+0bhxmAqxwHGRu6cTsPRU+/vl
   zY+KTDEg1zJCbVxFecuFw+dj5DJ/mGaWKt8oVlBA5uRQEPM7SkrRbwyZV
   w==;
X-CSE-ConnectionGUID: liGuM1+gQFeyRbp1OFynSw==
X-CSE-MsgGUID: VfFQfNB9RFuX+csBH07NaA==
X-IronPort-AV: E=McAfee;i="6600,9927,11092"; a="14232760"
X-IronPort-AV: E=Sophos;i="6.08,213,1712646000"; 
   d="scan'208";a="14232760"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jun 2024 04:51:18 -0700
X-CSE-ConnectionGUID: c2n2s6TbQXOWMj+cbmMxSQ==
X-CSE-MsgGUID: rf7paiszQ8eJp+bplxryvg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,213,1712646000"; 
   d="scan'208";a="60406376"
Received: from unknown (HELO 0610945e7d16) ([10.239.97.151])
  by fmviesa002.fm.intel.com with ESMTP; 04 Jun 2024 04:51:17 -0700
Received: from kbuild by 0610945e7d16 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sESh8-000N9k-1O;
	Tue, 04 Jun 2024 11:51:14 +0000
Date: Tue, 4 Jun 2024 19:50:20 +0800
From: kernel test robot <lkp@intel.com>
To: Peter Zijlstra <peterz@infradead.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [peterz-queue:sched/eevdf 7/23] kernel/sched/core.c:1992:13: error:
 conflicting types for 'dequeue_task'
Message-ID: <202406041901.CkjG6mzD-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/peterz/queue.git sched/eevdf
head:   642ed673fcd170ce20c64fb0e1970259fbb05cba
commit: e62a29c0e8a181ae8f53b5c637e28ec3f5e3703d [7/23] sched: Allow sched_class::dequeue_task() to fail
config: arm-allnoconfig (https://download.01.org/0day-ci/archive/20240604/202406041901.CkjG6mzD-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project d7d2d4f53fc79b4b58e8d8d08151b577c3699d4a)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240604/202406041901.CkjG6mzD-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406041901.CkjG6mzD-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from kernel/sched/core.c:10:
   In file included from include/linux/highmem.h:8:
   In file included from include/linux/cacheflush.h:5:
   In file included from arch/arm/include/asm/cacheflush.h:10:
   In file included from include/linux/mm.h:2253:
   include/linux/vmstat.h:514:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     514 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
>> kernel/sched/core.c:1992:13: error: conflicting types for 'dequeue_task'
    1992 | inline bool dequeue_task(struct rq *rq, struct task_struct *p, int flags)
         |             ^
   kernel/sched/sched.h:3561:13: note: previous declaration is here
    3561 | extern void dequeue_task(struct rq *rq, struct task_struct *p, int flags);
         |             ^
   1 warning and 1 error generated.


vim +/dequeue_task +1992 kernel/sched/core.c

  1988	
  1989	/*
  1990	 * Must only return false when DEQUEUE_SLEEP.
  1991	 */
> 1992	inline bool dequeue_task(struct rq *rq, struct task_struct *p, int flags)
  1993	{
  1994		if (sched_core_enabled(rq))
  1995			sched_core_dequeue(rq, p, flags);
  1996	
  1997		if (!(flags & DEQUEUE_NOCLOCK))
  1998			update_rq_clock(rq);
  1999	
  2000		if (!(flags & DEQUEUE_SAVE)) {
  2001			sched_info_dequeue(rq, p);
  2002			psi_dequeue(p, flags & DEQUEUE_SLEEP);
  2003		}
  2004	
  2005		uclamp_rq_dec(rq, p);
  2006		return p->sched_class->dequeue_task(rq, p, flags);
  2007	}
  2008	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
