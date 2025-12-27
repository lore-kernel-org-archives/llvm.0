Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20E571E5B73;
	Sat, 27 Dec 2025 08:50:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766825434; cv=none; b=ETq3U6kQiGJZhGbLGwm0VYNkX6NvEh50Q04iQ6KMzmkfBtpcX+9X02fM79o9ZFsX88rY1cA+KsmxngX6osMsgKrbKvt5ZGP3UfiyboiElZ4x/k+WRxPpQYJkM6grTpmi/Gwp7bDHMK2HQ4/y4OnEQJhuidtMEuprKA1/Je4eHC8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766825434; c=relaxed/simple;
	bh=wLSKjGgnTTvLtU+MDxSoJJKs4H9tjEIevTkPh/XxLOo=;
	h=Date:From:To:Cc:Subject:Message-ID; b=QfVQhK6CcTNfs74fwRq5hPLJ8mqsnog7xTwIn2Umm4P+Dtmk+dbUHC5PEfmrUrGLIrQ5CAnGfNRRMI2ZEb5dBt4rXSdTYNZGwPK4P0gX+YkTJtWqf2PnLgtugErsy2PhXN3GrUPbHozUDes77MvSA3JtwSU/tKVW13PBP2UpMCI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=n9gF4zOK; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="n9gF4zOK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766825434; x=1798361434;
  h=date:from:to:cc:subject:message-id;
  bh=wLSKjGgnTTvLtU+MDxSoJJKs4H9tjEIevTkPh/XxLOo=;
  b=n9gF4zOKNbweiOHpIHWYA3TxvrGjHc7k7MJCYwrsDLcC16qTybqYOVi6
   RDytOBc6gWYwRODC3i5NnV8YZt/WxgH5rrl7jgswnIYVd+8TR+a5V4dVG
   9C28JMywNjr6+0fsbmnRKeGvP3uUAiteQZ3+zDDTgiXu0q8rmh00Ihxiz
   CY+wFW3UMb2nK6AuettqyTX4Th5PzCoknjy6h9Zx7xHmOVStkhFvH7Y0n
   noQK7lm8LF9kZSJ66O5G1aMqVTfAByg/DNylkB3dko4lfoXrRL9lS6a7x
   YeCmLQIXeeBsUshJ9CYE70cSYZetGl7a6VuY95y8Wny0E3wbDTZOINplb
   g==;
X-CSE-ConnectionGUID: 7/RIFoh+QFySuJLFGq+WuA==
X-CSE-MsgGUID: gEpoBFk0QkOQGnLaDciEGQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11653"; a="72162917"
X-IronPort-AV: E=Sophos;i="6.21,180,1763452800"; 
   d="scan'208";a="72162917"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Dec 2025 00:50:34 -0800
X-CSE-ConnectionGUID: vzGMNmm6QY66TifFsVfN1g==
X-CSE-MsgGUID: 1OJhP7MvQyyLgV323MVJSw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,180,1763452800"; 
   d="scan'208";a="205052172"
Received: from lkp-server02.sh.intel.com (HELO dd3453e2b682) ([10.239.97.151])
  by orviesa004.jf.intel.com with ESMTP; 27 Dec 2025 00:50:32 -0800
Received: from kbuild by dd3453e2b682 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vZQ0H-000000005hR-2E7v;
	Sat, 27 Dec 2025 08:50:26 +0000
Date: Sat, 27 Dec 2025 16:49:40 +0800
From: kernel test robot <lkp@intel.com>
To: Chao Yu <chao@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [chao:feature/lock_trace 1/11] fs/f2fs/checkpoint.c:35:18:
 error: variable has incomplete type 'struct rq_flags'
Message-ID: <202512271655.5KGtzBqk-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/chao/linux.git feature/lock_trace
head:   76d9d8ea13699c3b05f129b7bff8b8be75a3ceac
commit: ea81438a866d420bd5126cbd29052bf9dd57511c [1/11] f2fs: add lock elapsed time trace facility for f2fs rwsemphore
config: powerpc-randconfig-002-20251227 (https://download.01.org/0day-ci/archive/20251227/202512271655.5KGtzBqk-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 4ef602d446057dabf5f61fb221669ecbeda49279)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251227/202512271655.5KGtzBqk-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512271655.5KGtzBqk-lkp@intel.com/

All errors (new ones prefixed by >>):

>> fs/f2fs/checkpoint.c:35:18: error: variable has incomplete type 'struct rq_flags'
      35 |         struct rq_flags rf;
         |                         ^
   include/linux/sched.h:640:8: note: forward declaration of 'struct rq_flags'
     640 | struct rq_flags;
         |        ^
>> fs/f2fs/checkpoint.c:38:7: error: call to undeclared function 'task_rq_lock'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
      38 |         rq = task_rq_lock(t, &rf);
         |              ^
>> fs/f2fs/checkpoint.c:40:2: error: call to undeclared function 'task_rq_unlock'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
      40 |         task_rq_unlock(rq, t, &rf);
         |         ^
   3 errors generated.


vim +35 fs/f2fs/checkpoint.c

    25	
    26	#ifdef CONFIG_64BIT
    27	static inline u64 get_sum_exec_runtime(struct task_struct *t)
    28	{
    29		return t->se.sum_exec_runtime;
    30	}
    31	#else /* !CONFIG_64BIT: */
    32	static u64 get_sum_exec_runtime(struct task_struct *t)
    33	{
    34		u64 ns;
  > 35		struct rq_flags rf;
    36		struct rq *rq;
    37	
  > 38		rq = task_rq_lock(t, &rf);
    39		ns = t->se.sum_exec_runtime;
  > 40		task_rq_unlock(rq, t, &rf);
    41	
    42		return ns;
    43	}
    44	#endif /* !CONFIG_64BIT */
    45	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
