Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E983E1F4CB0;
	Wed,  7 May 2025 09:43:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746611024; cv=none; b=kVGgh70za0OBpI2dNUHf59AmTJhDbmOv59a6BRm1Fo2RtIM2d5sDLDWmGIEE5Sp8tOwc0MnTYEeWn7G8OpKVu1Du5Q8uh4+/GbC6IwvZZC0IzaC+w/OLQ4k8v7pL+JOO7wbe02rxksvX5h8QW6NZUB2+2lIKtNudWZyi3apSuoY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746611024; c=relaxed/simple;
	bh=mpxBgNCy/F0aUxpvHnQEKoImq/8iziKL8AsnxKz7uX8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=DZkFk5Z7W4i7p2QQKyZ2GArYAbpBQEqCUqK9tOlfbbKUPxd1zwzAHc1ZAvCiKw50id2F8faBIZAoyC6E1ND7uH6h8CbH1JISkKDaUDtDhCopwFQxHTJIDq4mKayjzj6ZCWjVAcRbIwh8Ce0Sp4CN/+jjgMFVHBgpEmd1r9L1lW4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NzhQKWGY; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NzhQKWGY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746611023; x=1778147023;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=mpxBgNCy/F0aUxpvHnQEKoImq/8iziKL8AsnxKz7uX8=;
  b=NzhQKWGYnhK78r+5nK78orauO0NXKfEi2W13tmBbMfwmAKFQSwxpyOo8
   9l4Z+Feoa2R94e0C4370OB8mn09T2iaBc2hJXwZRQdgZfhg2UeZ0UujfY
   8uD7GlfJ/BQWV4UkMRtrnOjC9avUW9E+oqhzB3MLe2+weaaXOzWT+LfYF
   Uy2VYc2uzCt36/c+dUtkcdlrb5iK01b8VfFDio9Mz3CVue/3uSdbKYqMu
   mTKddKAGCpuBgCVpyDG1uZ9z5M3yJ2I/5cJFNUG248OgluS4ra4r24Ob5
   ujMWcDGad1O6331ErMI70qC5VwHK3CDAVp2L1b6/mvAFUdK3eXREeUDhc
   A==;
X-CSE-ConnectionGUID: H4q/yljxQwCfPcirQhP40w==
X-CSE-MsgGUID: i1fCxh44Q5CbfcI8SizIEg==
X-IronPort-AV: E=McAfee;i="6700,10204,11425"; a="59727560"
X-IronPort-AV: E=Sophos;i="6.15,268,1739865600"; 
   d="scan'208";a="59727560"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 May 2025 02:43:43 -0700
X-CSE-ConnectionGUID: 8NmRYL2gQ72+WAitRIXung==
X-CSE-MsgGUID: uiaS/QSNSx2EHQrnV6fHIg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,268,1739865600"; 
   d="scan'208";a="159194789"
Received: from igk-lkp-server01.igk.intel.com (HELO b9ffd1689040) ([10.211.3.150])
  by fmviesa002.fm.intel.com with ESMTP; 07 May 2025 02:43:42 -0700
Received: from kbuild by b9ffd1689040 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uCbJS-00009K-2m;
	Wed, 07 May 2025 09:43:38 +0000
Date: Wed, 7 May 2025 17:42:57 +0800
From: kernel test robot <lkp@intel.com>
To: Peter Zijlstra <peterz@infradead.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Subject: [peterz-queue:locking/futex 3/23] kernel/futex/waitwake.c:343:
 warning: expecting prototype for futex_wait_queue(). Prototype was for
 futex_do_wait() instead
Message-ID: <202505071708.iowmDlNC-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/peterz/queue.git locking/futex
head:   9140f57c1c1391a0343a08daea9cd53f56e51154
commit: 93f1b6d79a73b520b6875cf3babf4a09acc4eef0 [3/23] futex: Move futex_queue() into futex_wait_setup()
config: x86_64-kexec (https://download.01.org/0day-ci/archive/20250507/202505071708.iowmDlNC-lkp@intel.com/config)
compiler: clang version 20.1.2 (https://github.com/llvm/llvm-project 58df0ef89dd64126512e4ee27b4ac3fd8ddf6247)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250507/202505071708.iowmDlNC-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505071708.iowmDlNC-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> kernel/futex/waitwake.c:343: warning: expecting prototype for futex_wait_queue(). Prototype was for futex_do_wait() instead
>> kernel/futex/waitwake.c:585: warning: Function parameter or struct member 'task' not described in 'futex_wait_setup'


vim +343 kernel/futex/waitwake.c

a046f1a0d3e320 Peter Zijlstra 2021-09-23  335  
a046f1a0d3e320 Peter Zijlstra 2021-09-23  336  /**
a046f1a0d3e320 Peter Zijlstra 2021-09-23  337   * futex_wait_queue() - futex_queue() and wait for wakeup, timeout, or signal
a046f1a0d3e320 Peter Zijlstra 2021-09-23  338   * @hb:		the futex hash bucket, must be locked by the caller
a046f1a0d3e320 Peter Zijlstra 2021-09-23  339   * @q:		the futex_q to queue up on
a046f1a0d3e320 Peter Zijlstra 2021-09-23  340   * @timeout:	the prepared hrtimer_sleeper, or null for no timeout
a046f1a0d3e320 Peter Zijlstra 2021-09-23  341   */
93f1b6d79a73b5 Peter Zijlstra 2025-04-16  342  void futex_do_wait(struct futex_q *q, struct hrtimer_sleeper *timeout)
a046f1a0d3e320 Peter Zijlstra 2021-09-23 @343  {
a046f1a0d3e320 Peter Zijlstra 2021-09-23  344  	/* Arm the timer */
a046f1a0d3e320 Peter Zijlstra 2021-09-23  345  	if (timeout)
a046f1a0d3e320 Peter Zijlstra 2021-09-23  346  		hrtimer_sleeper_start_expires(timeout, HRTIMER_MODE_ABS);
a046f1a0d3e320 Peter Zijlstra 2021-09-23  347  
a046f1a0d3e320 Peter Zijlstra 2021-09-23  348  	/*
a046f1a0d3e320 Peter Zijlstra 2021-09-23  349  	 * If we have been removed from the hash list, then another task
a046f1a0d3e320 Peter Zijlstra 2021-09-23  350  	 * has tried to wake us, and we can skip the call to schedule().
a046f1a0d3e320 Peter Zijlstra 2021-09-23  351  	 */
a046f1a0d3e320 Peter Zijlstra 2021-09-23  352  	if (likely(!plist_node_empty(&q->list))) {
a046f1a0d3e320 Peter Zijlstra 2021-09-23  353  		/*
a046f1a0d3e320 Peter Zijlstra 2021-09-23  354  		 * If the timer has already expired, current will already be
a046f1a0d3e320 Peter Zijlstra 2021-09-23  355  		 * flagged for rescheduling. Only call schedule if there
a046f1a0d3e320 Peter Zijlstra 2021-09-23  356  		 * is no timeout, or if it has yet to expire.
a046f1a0d3e320 Peter Zijlstra 2021-09-23  357  		 */
a046f1a0d3e320 Peter Zijlstra 2021-09-23  358  		if (!timeout || timeout->task)
f5d39b02080914 Peter Zijlstra 2022-08-22  359  			schedule();
a046f1a0d3e320 Peter Zijlstra 2021-09-23  360  	}
a046f1a0d3e320 Peter Zijlstra 2021-09-23  361  	__set_current_state(TASK_RUNNING);
a046f1a0d3e320 Peter Zijlstra 2021-09-23  362  }
a046f1a0d3e320 Peter Zijlstra 2021-09-23  363  

:::::: The code at line 343 was first introduced by commit
:::::: a046f1a0d3e320cfee6bdac336416a537f49e7c6 futex: Split out wait/wake

:::::: TO: Peter Zijlstra <peterz@infradead.org>
:::::: CC: Peter Zijlstra <peterz@infradead.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
