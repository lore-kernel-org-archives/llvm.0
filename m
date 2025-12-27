Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 447C7154BF5;
	Sat, 27 Dec 2025 13:24:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766841850; cv=none; b=c4Zo+72I9En/JOh0PxpPBsj0w/pjoVRFq7yPWSiVWba78Qp4NnNKnIDbJcOS22j2OQlsFlUdV9GWl46Y+ZYcxtAdWo6/29QE2Z7OEoGGHj7NV3hZVBsXNLOM4Y+3hiNmiAQXqaFaE/ile80LOrynJx/2b/+CK28fUbcaRmzL2ro=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766841850; c=relaxed/simple;
	bh=MTN64UOfmWKZgF2uN4JzGrrlM7gLmPL4rjrDdtJ69ak=;
	h=Date:From:To:Cc:Subject:Message-ID; b=ndhNeaVogmfDGTVh/6KdOKkJ/hjbeY5WbWhSLe7lMLelYDUD6VYYc5LIpFLoQHIZL9KRn6ER6n/ClI2Q+BiRpBah/2BuHb9pHXiPCSRV3fLxtGp00suuc0R5TOnZMwBr3KTxyEqA3Ihf3ooiPNPauBUq9+W8EtHAxkUIe6EqDng=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=aD+iJ0iE; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="aD+iJ0iE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766841849; x=1798377849;
  h=date:from:to:cc:subject:message-id;
  bh=MTN64UOfmWKZgF2uN4JzGrrlM7gLmPL4rjrDdtJ69ak=;
  b=aD+iJ0iEvtwEVfmPfWuHNDOyCTA/mUCcmUQfXy030JUiMA6KA73g3Qfp
   P3b3csv5ofbySvjHJv2JwNhJ2ZnXTKaZD+2vGRHd/zT0ZhJRkOGwxiMUU
   tHRWxPRSgc4jt7RrYHkALgrmWJW7znWOrCFWcGUlQQ9phXb6C6C/AgH14
   xcW4WsIxo12OH0BEwGQrZkF5tAkJxxJabx9l5tgkXUxD7+z5HkKuKfD0o
   Eh27xNUoNEcv4KH8nM/TISTaOJI8fm4sSY1B8xwHlFaCLimcG/l4lGABL
   K5qCs21P2nYMmLRlIEzl9FWETCszWVd/U+6CkDIA1aw7OX2m0stc99dly
   A==;
X-CSE-ConnectionGUID: 2615NJh3SoOI4smGQVSMxg==
X-CSE-MsgGUID: Yq3DTc8XSfeiPGZ7svN4Bw==
X-IronPort-AV: E=McAfee;i="6800,10657,11654"; a="79176479"
X-IronPort-AV: E=Sophos;i="6.21,180,1763452800"; 
   d="scan'208";a="79176479"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Dec 2025 05:24:08 -0800
X-CSE-ConnectionGUID: SZ5SSthNS8qaaxpoAWxWgg==
X-CSE-MsgGUID: lefJGmzATfWmHQooBs4Nbg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,180,1763452800"; 
   d="scan'208";a="231628950"
Received: from lkp-server02.sh.intel.com (HELO dd3453e2b682) ([10.239.97.151])
  by fmviesa001.fm.intel.com with ESMTP; 27 Dec 2025 05:24:06 -0800
Received: from kbuild by dd3453e2b682 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vZUH5-000000005r1-44c0;
	Sat, 27 Dec 2025 13:24:03 +0000
Date: Sat, 27 Dec 2025 21:23:37 +0800
From: kernel test robot <lkp@intel.com>
To: Chao Yu <chao@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [chao:feature/lock_trace 12/12] fs/f2fs/checkpoint.c:84:3:
 error: call to undeclared function 'inject_timeout'; ISO C99 and later do not
 support implicit function declarations
Message-ID: <202512272106.IboSmrsA-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/chao/linux.git feature/lock_trace
head:   a9004baf110bf87f6a75b023c26616d966c93733
commit: f9743bca5f65d63981311ab66455aacdf1de7fd2 [12/12] f2fs: sysfs: introduce inject_lock_timeout
config: arm-randconfig-003-20251227 (https://download.01.org/0day-ci/archive/20251227/202512272106.IboSmrsA-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 4ef602d446057dabf5f61fb221669ecbeda49279)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251227/202512272106.IboSmrsA-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512272106.IboSmrsA-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   In file included from fs/f2fs/hash.c:18:
>> fs/f2fs/f2fs.h:4945:6: warning: no previous prototype for function 'f2fs_simulate_lock_timeout' [-Wmissing-prototypes]
    4945 | void f2fs_simulate_lock_timeout(struct f2fs_sb_info *sbi) { return; }
         |      ^
   fs/f2fs/f2fs.h:4945:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    4945 | void f2fs_simulate_lock_timeout(struct f2fs_sb_info *sbi) { return; }
         | ^
         | static 
   1 warning generated.
--
   In file included from fs/f2fs/checkpoint.c:22:
>> fs/f2fs/f2fs.h:4945:6: warning: no previous prototype for function 'f2fs_simulate_lock_timeout' [-Wmissing-prototypes]
    4945 | void f2fs_simulate_lock_timeout(struct f2fs_sb_info *sbi) { return; }
         |      ^
   fs/f2fs/f2fs.h:4945:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    4945 | void f2fs_simulate_lock_timeout(struct f2fs_sb_info *sbi) { return; }
         | ^
         | static 
   fs/f2fs/checkpoint.c:37:18: error: variable has incomplete type 'struct rq_flags'
      37 |         struct rq_flags rf;
         |                         ^
   include/linux/sched.h:640:8: note: forward declaration of 'struct rq_flags'
     640 | struct rq_flags;
         |        ^
   fs/f2fs/checkpoint.c:40:7: error: call to undeclared function 'task_rq_lock'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
      40 |         rq = task_rq_lock(t, &rf);
         |              ^
   fs/f2fs/checkpoint.c:42:2: error: call to undeclared function 'task_rq_unlock'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
      42 |         task_rq_unlock(rq, t, &rf);
         |         ^
>> fs/f2fs/checkpoint.c:84:3: error: call to undeclared function 'inject_timeout'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
      84 |                 inject_timeout(sem->sbi);
         |                 ^
   1 warning and 4 errors generated.


vim +/inject_timeout +84 fs/f2fs/checkpoint.c

    70	
    71	static inline void trace_lock_elapsed_time_end(struct f2fs_rwsem *sem,
    72					struct f2fs_lock_context *lc, bool is_write)
    73	{
    74		struct f2fs_time_stat tts;
    75		unsigned long long total_time, running_time;
    76		unsigned long long runnable_time = 0;
    77		unsigned long long io_sleep_time = 0;
    78		unsigned long long other_time = 0;
    79	
    80		if (!lc->lock_trace)
    81			return;
    82	
    83		if (time_to_inject(sem->sbi, FAULT_LOCK_TIMEOUT))
  > 84			inject_timeout(sem->sbi);
    85	
    86		get_lock_elapsed_time(&tts);
    87	
    88		total_time = (tts.total_time - lc->ts.total_time) / NSEC_PER_MSEC;
    89		if (total_time <= sem->sbi->max_lock_elapsed_time)
    90			return;
    91	
    92		running_time = (tts.running_time - lc->ts.running_time) / NSEC_PER_MSEC;
    93	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
