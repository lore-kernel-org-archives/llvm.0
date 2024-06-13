Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6CC1384;
	Thu, 13 Jun 2024 00:03:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718237001; cv=none; b=fy1hD2nefxmfNjUD84QGXkC3Paf4vwmfhpXNEabNCL73gY5u3UvqUcGNzcupzF5CF4MIsqaUD7zKAcQOv0cO4ntPEydjJ1294Re2Xmq9mEHjIeyJYoH0qmPtuyrrO6odTIgN3EhHoQH5Tkq4ALvsqMaRdePbcejA6blgAuWpkCo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718237001; c=relaxed/simple;
	bh=ESoaO23G6xmGK73GO1SiyRn4xgTk+fTNMI6pAgxqVoc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=CcaNyrJxYCMmQCpku41hAKGYaLnCqNw84/p1+lHrG5oVJvfQg5MGsgywwtL5laXDpSKdTRNeN+RH/QQ6GXv2mdzO38H22JSPVdcp4U37u7pG5mx5l2Nh44xLR+x65IwwRMwwOFaFg5lQnSk6wTqPehMfaBdf2U9xaU4Kkgg55u0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lVxygNgk; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lVxygNgk"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1718236999; x=1749772999;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ESoaO23G6xmGK73GO1SiyRn4xgTk+fTNMI6pAgxqVoc=;
  b=lVxygNgkFQKJJpu3y7bwIvHIpAsLqkUipRjmgMniIq10NQJf2vHmUu/B
   5s7Ta2UvuRmZNoZfrLEe4mpJLxViYf1LOuyzWZcQohQtYG67S/wnvbLYV
   ESlp/5k7iemuvUI5ypm6azsJpx7BqncBFrgK0XR5zvYvXe7eU9LzVMS3V
   vdXNS0vTZ+nWrxYZXhuFjyPvkYoynIzkqVlSWNWs6eUR4P9+fEj2YhfpS
   vFcYStam+ucl/plcLMpUJFuXmkNwIpMWpREQyq8nz5ti1L0FqUeUiCoMr
   7elfsSEHguUU4TO5pTC3Ty3SEOnkmg+u0AfkwrBYLVfS72F8FEx8q3Cw6
   A==;
X-CSE-ConnectionGUID: Zst5FeOlSkqNdAdacC/EXA==
X-CSE-MsgGUID: Cp4UMv0vS0+388xZnhd/xw==
X-IronPort-AV: E=McAfee;i="6700,10204,11101"; a="18811426"
X-IronPort-AV: E=Sophos;i="6.08,234,1712646000"; 
   d="scan'208";a="18811426"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jun 2024 17:03:19 -0700
X-CSE-ConnectionGUID: XfhOJlrSRVOOKiq+LiL5Vw==
X-CSE-MsgGUID: XzXafOmhQY6T2hKNzOgKng==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,234,1712646000"; 
   d="scan'208";a="70746656"
Received: from lkp-server01.sh.intel.com (HELO 628d7d8b9fc6) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 12 Jun 2024 17:03:19 -0700
Received: from kbuild by 628d7d8b9fc6 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sHXvw-00021e-0J;
	Thu, 13 Jun 2024 00:03:16 +0000
Date: Thu, 13 Jun 2024 08:02:45 +0800
From: kernel test robot <lkp@intel.com>
To: Chuck Lever <chuck.lever@oracle.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [cel:nfsd-testing 10/10] net/sunrpc/sched.c:411:10: error: no member
 named 'tk_pid' in 'struct rpc_task'
Message-ID: <202406130811.7nwAH0zD-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://git.kernel.org/pub/scm/linux/kernel/git/cel/linux nfsd-testing
head:   322bb43cff91c5d5f74f7249adad9dc75fffa231
commit: 322bb43cff91c5d5f74f7249adad9dc75fffa231 [10/10] SUNRPC: Emit a trace event when a timeout occurs
config: riscv-defconfig (https://download.01.org/0day-ci/archive/20240613/202406130811.7nwAH0zD-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project 4403cdbaf01379de96f8d0d6ea4f51a085e37766)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240613/202406130811.7nwAH0zD-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406130811.7nwAH0zD-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   In file included from net/sunrpc/clnt.c:24:
   In file included from include/linux/kallsyms.h:13:
   In file included from include/linux/mm.h:2253:
   include/linux/vmstat.h:514:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     514 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
>> net/sunrpc/clnt.c:2373:19: warning: unused variable 'req' [-Wunused-variable]
    2373 |         struct rpc_rqst *req = task->tk_rqstp;
         |                          ^~~
   2 warnings generated.
--
   In file included from net/sunrpc/sched.c:16:
   In file included from include/linux/interrupt.h:21:
   In file included from arch/riscv/include/asm/sections.h:9:
   In file included from include/linux/mm.h:2253:
   include/linux/vmstat.h:514:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     514 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
>> net/sunrpc/sched.c:411:10: error: no member named 'tk_pid' in 'struct rpc_task'
     411 |                         task->tk_pid,
         |                         ~~~~  ^
   1 warning and 1 error generated.


vim +411 net/sunrpc/sched.c

   399	
   400	static void __rpc_sleep_on_priority_timeout(struct rpc_wait_queue *q,
   401			struct rpc_task *task, unsigned long timeout,
   402			unsigned char queue_priority)
   403	{
   404		if (WARN_ON_ONCE(RPC_IS_QUEUED(task)))
   405			return;
   406		if (time_is_after_jiffies(timeout)) {
   407			__rpc_do_sleep_on_priority(q, task, queue_priority);
   408			__rpc_add_timer(q, task, timeout);
   409		} else {
   410			trace_printk("task:%08x@%08x timed out\n",
 > 411				task->tk_pid,
   412				task->tk_client ?  task->tk_client->cl_clid : -1);
   413			task->tk_status = -ETIMEDOUT;
   414		}
   415	}
   416	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
