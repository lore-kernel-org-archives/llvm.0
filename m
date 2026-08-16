Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7331D1F2B88;
	Sun, 16 Aug 2026 13:59:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786888764; cv=none; b=NaxmQibrjc7aUVAzvTB5vZQ16pBN9Ltr7X9GmwAskPndGCiFNfjJqrio/9/QZTjLISHNBOsDSrVp3wp7McCpOS75ExYL00MU79ocMiutNNqfsvpZ0hS2ZmpCCAS2XWGVV+2YFkOnils5vR2G24IoqB/une4lgqGbUzT4vFwyQo0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786888764; c=relaxed/simple;
	bh=ybrlKZHnphcNdbxsCP6DNy7Rf0tFcREloQ8dWcNJo7s=;
	h=Date:From:To:Cc:Subject:Message-ID; b=CQZHfbfQCLQKe70h5uh6GXDPRcz52yibqnd1QvJhjly07ilgB0IQiHLOHFTzfxP57cp0CFcPnhuBmR7LlSR+Crw5vl+ui9X/SGXRMGkbkxQZDfxM6HDcrs+nu4OqzPDS85F4wNDB4vFqCwCAwlUfgUr6P3TZ3tYthjQ5BoGz0DA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Q4OBDmG9; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Q4OBDmG9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1786888762; x=1818424762;
  h=date:from:to:cc:subject:message-id;
  bh=ybrlKZHnphcNdbxsCP6DNy7Rf0tFcREloQ8dWcNJo7s=;
  b=Q4OBDmG97NkY7oNTrhKjkk8JYx96Hn3wB1LRlnPhXEMyeg/BaNjnjJ/9
   rW6yNkweFqlwg7NmbHS6+YkCjER5ezci/iCkveGyLBjuA9xVxPolnP3xj
   9Obzi6dRKn84P6NsSRMi05ZHjn1LQL7W5py/+/Y0BYJSqow5zMc7fdn0a
   aWJvnOGPXrtyYeMiy5RR3QRs47faVjKlUGuYQTUgiSRZL/Mp6lUbTTc7j
   aQF0bSLU2UefM/SZrO1lzfYn4FcSX2sFx1AEdKnkhOWnKxSh8Ype+/h9f
   WMKHUhcLs5T4bhDxyIjj1yN4iwU/zB+hwuSv8c0kdLWv5l8t7Tir7n1Y9
   Q==;
X-CSE-ConnectionGUID: lNjGLTXYSGWQx4dHE4H3qg==
X-CSE-MsgGUID: sQuLkd+NQcW5cBKzFYJXPg==
X-IronPort-AV: E=McAfee;i="6800,10657,11876"; a="98540449"
X-IronPort-AV: E=Sophos;i="6.25,227,1779174000"; 
   d="scan'208";a="98540449"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Aug 2026 06:59:21 -0700
X-CSE-ConnectionGUID: eGLVH6JOSFq/K7VqqZUNbg==
X-CSE-MsgGUID: hKhzWDX/ReCC82T8FxpW4A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,227,1779174000"; 
   d="scan'208";a="264726470"
Received: from igk-lkp-server01.igk.intel.com (HELO 3cba2a188a06) ([10.211.93.152])
  by orviesa007.jf.intel.com with ESMTP; 16 Aug 2026 06:59:20 -0700
Received: from kbuild by 3cba2a188a06 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wvbOP-000000006az-1QmC;
	Sun, 16 Aug 2026 13:59:17 +0000
Date: Sun, 16 Aug 2026 15:58:26 +0200
From: kernel test robot <lkp@intel.com>
To: Steven Rostedt <rostedt@goodmis.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 0day robot <lkp@intel.com>
Subject: lib/sys_info.c:154:3: error: call to undeclared function
 'ftrace_dump'; ISO C99 and later do not support implicit function
 declarations
Message-ID: <202608161529.P5YMPr86-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://github.com/intel-lab-lkp/linux/commits/Steven-Rostedt/tracing-Move-non-trace_printk-prototypes-back-to-kernel-h/20260814-235157
head:   5803c3be0223106fdafb05968cefd241bf88fef1
commit: 5803c3be0223106fdafb05968cefd241bf88fef1 tracing: Add CONFIG_TRACE_PRINTK_DEBUGGING to clean up kernel.h
date:   2 days ago
config: x86_64-kexec (https://download.01.org/0day-ci/archive/20260816/202608161529.P5YMPr86-lkp@intel.com/config)
compiler: clang version 22.1.8 (https://github.com/llvm/llvm-project ca7933e47d3a3451d81e72ac174dcb5aa28b59d1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260816/202608161529.P5YMPr86-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202608161529.P5YMPr86-lkp@intel.com/

All errors (new ones prefixed by >>):

>> lib/sys_info.c:154:3: error: call to undeclared function 'ftrace_dump'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     154 |                 ftrace_dump(DUMP_ALL);
         |                 ^
   lib/sys_info.c:154:3: note: did you mean 'ftrace_bug'?
   include/linux/ftrace.h:739:6: note: 'ftrace_bug' declared here
     739 | void ftrace_bug(int err, struct dyn_ftrace *rec);
         |      ^
>> lib/sys_info.c:154:15: error: use of undeclared identifier 'DUMP_ALL'
     154 |                 ftrace_dump(DUMP_ALL);
         |                             ^~~~~~~~
   2 errors generated.
--
>> drivers/tty/sysrq.c:331:2: error: call to undeclared function 'ftrace_dump'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     331 |         ftrace_dump(DUMP_ALL);
         |         ^
   drivers/tty/sysrq.c:331:2: note: did you mean 'ftrace_bug'?
   include/linux/ftrace.h:739:6: note: 'ftrace_bug' declared here
     739 | void ftrace_bug(int err, struct dyn_ftrace *rec);
         |      ^
>> drivers/tty/sysrq.c:331:14: error: use of undeclared identifier 'DUMP_ALL'
     331 |         ftrace_dump(DUMP_ALL);
         |                     ^~~~~~~~
   2 errors generated.
--
   In file included from kernel/rcu/tree.c:4951:
>> kernel/rcu/tree_stall.h:238:3: error: call to undeclared function 'ftrace_dump'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     238 |                 rcu_ftrace_dump(DUMP_ALL);
         |                 ^
   kernel/rcu/rcu.h:337:3: note: expanded from macro 'rcu_ftrace_dump'
     337 |                 ftrace_dump(oops_dump_mode); \
         |                 ^
   kernel/rcu/tree_stall.h:238:3: note: did you mean 'ftrace_bug'?
   kernel/rcu/rcu.h:337:3: note: expanded from macro 'rcu_ftrace_dump'
     337 |                 ftrace_dump(oops_dump_mode); \
         |                 ^
   include/linux/ftrace.h:739:6: note: 'ftrace_bug' declared here
     739 | void ftrace_bug(int err, struct dyn_ftrace *rec);
         |      ^
   In file included from kernel/rcu/tree.c:4951:
>> kernel/rcu/tree_stall.h:238:19: error: use of undeclared identifier 'DUMP_ALL'
     238 |                 rcu_ftrace_dump(DUMP_ALL);
         |                                 ^~~~~~~~
   kernel/rcu/tree_stall.h:859:4: error: call to undeclared function 'ftrace_dump'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     859 |                         rcu_ftrace_dump(DUMP_ALL);
         |                         ^
   kernel/rcu/rcu.h:337:3: note: expanded from macro 'rcu_ftrace_dump'
     337 |                 ftrace_dump(oops_dump_mode); \
         |                 ^
   In file included from kernel/rcu/tree.c:4951:
   kernel/rcu/tree_stall.h:859:20: error: use of undeclared identifier 'DUMP_ALL'
     859 |                         rcu_ftrace_dump(DUMP_ALL);
         |                                         ^~~~~~~~
   4 errors generated.


vim +/ftrace_dump +154 lib/sys_info.c

d747755917bf8ae Feng Tang       2025-07-03  138  
03ef32d665e8a23 Feng Tang       2025-11-13  139  static void __sys_info(unsigned long si_mask)
b76e89e50fc3693 Feng Tang       2025-07-03  140  {
b76e89e50fc3693 Feng Tang       2025-07-03  141  	if (si_mask & SYS_INFO_TASKS)
b76e89e50fc3693 Feng Tang       2025-07-03  142  		show_state();
b76e89e50fc3693 Feng Tang       2025-07-03  143  
b76e89e50fc3693 Feng Tang       2025-07-03  144  	if (si_mask & SYS_INFO_MEM)
b76e89e50fc3693 Feng Tang       2025-07-03  145  		show_mem();
b76e89e50fc3693 Feng Tang       2025-07-03  146  
b76e89e50fc3693 Feng Tang       2025-07-03  147  	if (si_mask & SYS_INFO_TIMERS)
b76e89e50fc3693 Feng Tang       2025-07-03  148  		sysrq_timer_list_show();
b76e89e50fc3693 Feng Tang       2025-07-03  149  
b76e89e50fc3693 Feng Tang       2025-07-03  150  	if (si_mask & SYS_INFO_LOCKS)
b76e89e50fc3693 Feng Tang       2025-07-03  151  		debug_show_all_locks();
b76e89e50fc3693 Feng Tang       2025-07-03  152  
b76e89e50fc3693 Feng Tang       2025-07-03  153  	if (si_mask & SYS_INFO_FTRACE)
b76e89e50fc3693 Feng Tang       2025-07-03 @154  		ftrace_dump(DUMP_ALL);
b76e89e50fc3693 Feng Tang       2025-07-03  155  
760fc597c33d5a7 Andy Shevchenko 2025-10-30  156  	if (si_mask & SYS_INFO_ALL_BT)
b76e89e50fc3693 Feng Tang       2025-07-03  157  		trigger_all_cpu_backtrace();
b76e89e50fc3693 Feng Tang       2025-07-03  158  
b76e89e50fc3693 Feng Tang       2025-07-03  159  	if (si_mask & SYS_INFO_BLOCKED_TASKS)
b76e89e50fc3693 Feng Tang       2025-07-03  160  		show_state_filter(TASK_UNINTERRUPTIBLE);
b76e89e50fc3693 Feng Tang       2025-07-03  161  }
03ef32d665e8a23 Feng Tang       2025-11-13  162  

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
