Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C7FC30F549;
	Mon, 29 Dec 2025 12:06:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767010009; cv=none; b=g1LbT9hC4ig3srmwXIf1c6ZiR9TyPenHLKuxJDl8kxELdK9hVduF8RxJWoPr6EsICxJh42tRXbfjfZLibmPLbBQ8ilIkvZq8g1NsYYlPhxflG3YFurxCkCRiL66hvEGT0wI2fdoeyaNVziGwYkRRxHHSI3aTHzNuOGmfLYNlxe4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767010009; c=relaxed/simple;
	bh=WJ0wTiLVRLHuql433BUTWdIywi9WRC5uwva+JKhoWYY=;
	h=Date:From:To:Cc:Subject:Message-ID; b=QuAA0nh4bNoJmdHhOQjmYmAmLFmVQ4oyK+QpIceckQS9Lwg2jtngARk9D0V0cXrQTIrTB1NuWWe1ocj1EcNPg3CRtJ2zLph2frJMYG6gzgkv4tQNKndHE+Hxh3/7e7qk3eE/BAYQydL4j1V+3/1+uOGsolc3guA0lPhYkF8cndc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XxJisOkU; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XxJisOkU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1767010008; x=1798546008;
  h=date:from:to:cc:subject:message-id;
  bh=WJ0wTiLVRLHuql433BUTWdIywi9WRC5uwva+JKhoWYY=;
  b=XxJisOkUnEzF01Y96ac61B67VWUcm7YLilQJZgyuQENEd6bZ8KdKq4eF
   4QhjJxM2vuRMpaZQ+rlChNMl4G67qwT0iAOFOoFi3GnOYFBySNP8mq5yz
   rfiXEapdiP8E3vcJB+A9C/NzI+XZjcxDUG7SWomtV4fLu9Zbt+/ABgNTH
   K6ofY2KF+GhtT0ElYpqFdQOEnfVOGyGsoq4bgt1K9lNspTW1l/1QfaTuE
   Ro3xKUlkyW3j6BZJpeoYWr0n71L/JxgYlAjrSZN7GoRngrNqICIZrlNyg
   54c8TFLDQlnKzIaYZOW2mTWSNKAl9GoRcQPsca/D4j6Tgjtrk+zsYpBfb
   g==;
X-CSE-ConnectionGUID: aHMOg7KSR52ftJq+GpciAQ==
X-CSE-MsgGUID: ndGUG9EhTNmRBqt6zbBCoQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11655"; a="72242108"
X-IronPort-AV: E=Sophos;i="6.21,185,1763452800"; 
   d="scan'208";a="72242108"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Dec 2025 04:06:46 -0800
X-CSE-ConnectionGUID: N0GJz2HRQQKz1+CzD5u6AQ==
X-CSE-MsgGUID: CvVpjtDXTISn4hSPuKzlgg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,185,1763452800"; 
   d="scan'208";a="238322533"
Received: from lkp-server02.sh.intel.com (HELO dd3453e2b682) ([10.239.97.151])
  by orviesa001.jf.intel.com with ESMTP; 29 Dec 2025 04:06:44 -0800
Received: from kbuild by dd3453e2b682 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vaC1J-000000007Cp-0rJC;
	Mon, 29 Dec 2025 12:06:41 +0000
Date: Mon, 29 Dec 2025 20:06:04 +0800
From: kernel test robot <lkp@intel.com>
To: Chao Yu <chao@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [chao:feature/lock_trace 1/12] fs/f2fs/checkpoint.c:80:19:
 warning: variable 'running_time' is uninitialized when used here
Message-ID: <202512291909.whZx7q1m-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/chao/linux.git feature/lock_trace
head:   38316221f39afd9be305c1a9d7de368ac7d10a74
commit: c40d7d27f9806cf8ede8c91311f9431fa7df791b [1/12] f2fs: add lock elapsed time trace facility for f2fs rwsemphore
config: riscv-randconfig-002-20251229 (https://download.01.org/0day-ci/archive/20251229/202512291909.whZx7q1m-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251229/202512291909.whZx7q1m-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512291909.whZx7q1m-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> fs/f2fs/checkpoint.c:80:19: warning: variable 'running_time' is uninitialized when used here [-Wuninitialized]
      80 |         if (total_time > running_time + io_sleep_time + runnable_time)
         |                          ^~~~~~~~~~~~
   fs/f2fs/checkpoint.c:55:45: note: initialize the variable 'running_time' to silence this warning
      55 |         unsigned long long total_time, running_time;
         |                                                    ^
         |                                                     = 0
   1 warning generated.


vim +/running_time +80 fs/f2fs/checkpoint.c

    50	
    51	static inline void trace_lock_elapsed_time_end(struct f2fs_rwsem *sem,
    52					struct f2fs_lock_context *lc, bool is_write)
    53	{
    54		struct f2fs_time_stat tts;
    55		unsigned long long total_time, running_time;
    56		unsigned long long runnable_time = 0;
    57		unsigned long long io_sleep_time = 0;
    58		unsigned long long other_time = 0;
    59	
    60		if (!lc->lock_trace)
    61			return;
    62	
    63		get_lock_elapsed_time(&tts);
    64	
    65		total_time = (tts.total_time - lc->ts.total_time) / NSEC_PER_MSEC;
    66		if (total_time <= MAX_LOCK_ELAPSED_TIME)
    67			return;
    68	
    69	#ifdef CONFIG_64BIT
    70		running_time = (tts.running_time - lc->ts.running_time) / NSEC_PER_MSEC;
    71	#endif
    72	#if defined(CONFIG_SCHED_INFO) && defined(CONFIG_SCHEDSTATS)
    73		runnable_time = (tts.runnable_time - lc->ts.runnable_time) /
    74								NSEC_PER_MSEC;
    75	#endif
    76	#ifdef CONFIG_TASK_DELAY_ACCT
    77		io_sleep_time = (tts.io_sleep_time - lc->ts.io_sleep_time) /
    78								NSEC_PER_MSEC;
    79	#endif
  > 80		if (total_time > running_time + io_sleep_time + runnable_time)
    81			other_time = total_time - running_time -
    82					io_sleep_time - runnable_time;
    83	
    84		trace_f2fs_lock_elapsed_time(sem->sbi, sem->name, is_write, current,
    85				get_current_ioprio(), total_time, running_time,
    86				runnable_time, io_sleep_time, other_time);
    87	}
    88	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
