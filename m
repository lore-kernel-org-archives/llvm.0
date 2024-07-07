Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B13B71E4A1;
	Sun,  7 Jul 2024 14:38:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720363114; cv=none; b=ETr2fB4s1yYiPi/hm5uGkzOrYRq+yWpT0fO9umEMVvzRLjnKvoNt376y7G7Doh081YiYt52iH+29neJpp2Q0rUgBRoxfoPo1Q5iVhVBF+ZEGPhXnbbgjDXXJFY/r4O63Lvo+dKD6DqcS5JM8dj6uaqd0MXItKshky3FTHlexNcE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720363114; c=relaxed/simple;
	bh=oZEs5N6R1leN3oqvLfbDsY6/BPpLWEn4mdThgBsjPGs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=FTEFobpUYbZ/JIbeqqE9xFbmYT5hFQnyKc/oDcNmYCm4shRt0vQB/G6KRvBqVb4si15yWcxX4ePAQfCX6QOvoHJqckJHTz5LJxKZhJf0xFsp45ZZCCkU6ghFGO40sDj4hLIZ2zNBoTs60NXRQpQNHZF+I1sHdR1KqwRdeOjfCzI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CnDiDC4J; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CnDiDC4J"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1720363112; x=1751899112;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=oZEs5N6R1leN3oqvLfbDsY6/BPpLWEn4mdThgBsjPGs=;
  b=CnDiDC4JS+HDpDtRJB+83HEGLe4j/WO7oRcBPDc8aVX5FYeGjTs4FBhb
   /a6HoPHwL/bsNChtw3qNPCaD3nVOHtai7XOwtVXVOQoEdshvE5RZODs+P
   ngjFQ/TRqoohGpHCdQnKb58lN+TeyuawhpTCW2LE2OEra7QUmbzReSiwl
   D7yASpp9vqyUpHVQcq79PISKSLJwfxD9iWAUaj8/CG4/Pq+fY4KDs4TrJ
   uJGlUpelvQKFl1C7Sqgex3ym0YXZvBN4XLn2PhdxEEQOB+O41WrG6Ck1q
   H7SjJtD3oo/Dpd9Gaqn7bxDKXKX3ykMgCGsrqXbHtMtHKtc0goY1NlDd3
   g==;
X-CSE-ConnectionGUID: 11pONt1uTLuS66H8A90+Hw==
X-CSE-MsgGUID: h/eweikiSFWhCsZxFKNCRg==
X-IronPort-AV: E=McAfee;i="6700,10204,11126"; a="17404018"
X-IronPort-AV: E=Sophos;i="6.09,190,1716274800"; 
   d="scan'208";a="17404018"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jul 2024 07:38:31 -0700
X-CSE-ConnectionGUID: 3yXLJc+JRiielpwV1YUMng==
X-CSE-MsgGUID: KcLf1Va3Sxqzoh8L+R/aQw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,190,1716274800"; 
   d="scan'208";a="47698160"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 07 Jul 2024 07:38:30 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sQT23-000V1A-0s;
	Sun, 07 Jul 2024 14:38:27 +0000
Date: Sun, 7 Jul 2024 22:37:27 +0800
From: kernel test robot <lkp@intel.com>
To: Jeff Layton <jlayton@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [jlayton:kdevops 5/13] fs/inode.c:2627:23: error: call to
 '__compiletime_assert_408' declared with 'error' attribute: Need native word
 sized stores/loads for atomicity.
Message-ID: <202407072204.gzPNykeM-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jlayton/linux.git kdevops
head:   fa5a1c2afda6cefb7faa1963ddf30a8c33ab43f4
commit: 7ae9113ce4764896d7901a2a9c247234637e6895 [5/13] fs: add infrastructure for multigrain timestamps
config: arm-randconfig-004-20240707 (https://download.01.org/0day-ci/archive/20240707/202407072204.gzPNykeM-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project a0c6b8aef853eedaa0980f07c0a502a5a8a9740e)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240707/202407072204.gzPNykeM-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202407072204.gzPNykeM-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from fs/inode.c:9:
   In file included from include/linux/mm.h:2258:
   include/linux/vmstat.h:514:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     514 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
>> fs/inode.c:2627:23: error: call to '__compiletime_assert_408' declared with 'error' attribute: Need native word sized stores/loads for atomicity.
    2627 |         ktime_t now, floor = smp_load_acquire(&ctime_floor);
         |                              ^
   include/asm-generic/barrier.h:176:29: note: expanded from macro 'smp_load_acquire'
     176 | #define smp_load_acquire(p) __smp_load_acquire(p)
         |                             ^
   include/asm-generic/barrier.h:151:2: note: expanded from macro '__smp_load_acquire'
     151 |         compiletime_assert_atomic_type(*p);                             \
         |         ^
   include/linux/compiler_types.h:513:2: note: expanded from macro 'compiletime_assert_atomic_type'
     513 |         compiletime_assert(__native_word(t),                            \
         |         ^
   note: (skipping 1 expansions in backtrace; use -fmacro-backtrace-limit=0 to see all)
   include/linux/compiler_types.h:498:2: note: expanded from macro '_compiletime_assert'
     498 |         __compiletime_assert(condition, msg, prefix, suffix)
         |         ^
   include/linux/compiler_types.h:491:4: note: expanded from macro '__compiletime_assert'
     491 |                         prefix ## suffix();                             \
         |                         ^
   <scratch space>:67:1: note: expanded from here
      67 | __compiletime_assert_408
         | ^
   fs/inode.c:2166:18: error: call to '__compiletime_assert_387' declared with 'error' attribute: Need native word sized stores/loads for atomicity.
    2166 |         ktime_t floor = smp_load_acquire(&ctime_floor);
         |                         ^
   include/asm-generic/barrier.h:176:29: note: expanded from macro 'smp_load_acquire'
     176 | #define smp_load_acquire(p) __smp_load_acquire(p)
         |                             ^
   include/asm-generic/barrier.h:151:2: note: expanded from macro '__smp_load_acquire'
     151 |         compiletime_assert_atomic_type(*p);                             \
         |         ^
   include/linux/compiler_types.h:513:2: note: expanded from macro 'compiletime_assert_atomic_type'
     513 |         compiletime_assert(__native_word(t),                            \
         |         ^
   note: (skipping 1 expansions in backtrace; use -fmacro-backtrace-limit=0 to see all)
   include/linux/compiler_types.h:498:2: note: expanded from macro '_compiletime_assert'
     498 |         __compiletime_assert(condition, msg, prefix, suffix)
         |         ^
   include/linux/compiler_types.h:491:4: note: expanded from macro '__compiletime_assert'
     491 |                         prefix ## suffix();                             \
         |                         ^
   <scratch space>:29:1: note: expanded from here
      29 | __compiletime_assert_387
         | ^
>> fs/inode.c:2627:23: error: call to '__compiletime_assert_408' declared with 'error' attribute: Need native word sized stores/loads for atomicity.
    2627 |         ktime_t now, floor = smp_load_acquire(&ctime_floor);
         |                              ^
   include/asm-generic/barrier.h:176:29: note: expanded from macro 'smp_load_acquire'
     176 | #define smp_load_acquire(p) __smp_load_acquire(p)
         |                             ^
   include/asm-generic/barrier.h:151:2: note: expanded from macro '__smp_load_acquire'
     151 |         compiletime_assert_atomic_type(*p);                             \
         |         ^
   include/linux/compiler_types.h:513:2: note: expanded from macro 'compiletime_assert_atomic_type'
     513 |         compiletime_assert(__native_word(t),                            \
         |         ^
   note: (skipping 1 expansions in backtrace; use -fmacro-backtrace-limit=0 to see all)
   include/linux/compiler_types.h:498:2: note: expanded from macro '_compiletime_assert'
     498 |         __compiletime_assert(condition, msg, prefix, suffix)
         |         ^
   include/linux/compiler_types.h:491:4: note: expanded from macro '__compiletime_assert'
     491 |                         prefix ## suffix();                             \
         |                         ^
   <scratch space>:67:1: note: expanded from here
      67 | __compiletime_assert_408
         | ^
   fs/inode.c:2166:18: error: call to '__compiletime_assert_387' declared with 'error' attribute: Need native word sized stores/loads for atomicity.
    2166 |         ktime_t floor = smp_load_acquire(&ctime_floor);
         |                         ^
   include/asm-generic/barrier.h:176:29: note: expanded from macro 'smp_load_acquire'
     176 | #define smp_load_acquire(p) __smp_load_acquire(p)
         |                             ^
   include/asm-generic/barrier.h:151:2: note: expanded from macro '__smp_load_acquire'
     151 |         compiletime_assert_atomic_type(*p);                             \
         |         ^
   include/linux/compiler_types.h:513:2: note: expanded from macro 'compiletime_assert_atomic_type'
     513 |         compiletime_assert(__native_word(t),                            \
         |         ^
   note: (skipping 1 expansions in backtrace; use -fmacro-backtrace-limit=0 to see all)
   include/linux/compiler_types.h:498:2: note: expanded from macro '_compiletime_assert'
     498 |         __compiletime_assert(condition, msg, prefix, suffix)
         |         ^
   include/linux/compiler_types.h:491:4: note: expanded from macro '__compiletime_assert'
     491 |                         prefix ## suffix();                             \
         |                         ^
   <scratch space>:29:1: note: expanded from here
      29 | __compiletime_assert_387
         | ^
>> fs/inode.c:2627:23: error: call to '__compiletime_assert_408' declared with 'error' attribute: Need native word sized stores/loads for atomicity.
    2627 |         ktime_t now, floor = smp_load_acquire(&ctime_floor);
         |                              ^
   include/asm-generic/barrier.h:176:29: note: expanded from macro 'smp_load_acquire'
     176 | #define smp_load_acquire(p) __smp_load_acquire(p)
         |                             ^
   include/asm-generic/barrier.h:151:2: note: expanded from macro '__smp_load_acquire'
     151 |         compiletime_assert_atomic_type(*p);                             \
         |         ^
   include/linux/compiler_types.h:513:2: note: expanded from macro 'compiletime_assert_atomic_type'
     513 |         compiletime_assert(__native_word(t),                            \
         |         ^
   note: (skipping 1 expansions in backtrace; use -fmacro-backtrace-limit=0 to see all)
   include/linux/compiler_types.h:498:2: note: expanded from macro '_compiletime_assert'
     498 |         __compiletime_assert(condition, msg, prefix, suffix)
         |         ^
   include/linux/compiler_types.h:491:4: note: expanded from macro '__compiletime_assert'
     491 |                         prefix ## suffix();                             \
         |                         ^
   <scratch space>:67:1: note: expanded from here
      67 | __compiletime_assert_408
         | ^
   fs/inode.c:2166:18: error: call to '__compiletime_assert_387' declared with 'error' attribute: Need native word sized stores/loads for atomicity.
    2166 |         ktime_t floor = smp_load_acquire(&ctime_floor);
         |                         ^
   include/asm-generic/barrier.h:176:29: note: expanded from macro 'smp_load_acquire'
     176 | #define smp_load_acquire(p) __smp_load_acquire(p)
         |                             ^
   include/asm-generic/barrier.h:151:2: note: expanded from macro '__smp_load_acquire'
     151 |         compiletime_assert_atomic_type(*p);                             \
         |         ^
   include/linux/compiler_types.h:513:2: note: expanded from macro 'compiletime_assert_atomic_type'
     513 |         compiletime_assert(__native_word(t),                            \
         |         ^
   note: (skipping 1 expansions in backtrace; use -fmacro-backtrace-limit=0 to see all)
   include/linux/compiler_types.h:498:2: note: expanded from macro '_compiletime_assert'
     498 |         __compiletime_assert(condition, msg, prefix, suffix)
         |         ^
   include/linux/compiler_types.h:491:4: note: expanded from macro '__compiletime_assert'
     491 |                         prefix ## suffix();                             \
         |                         ^
   <scratch space>:29:1: note: expanded from here
      29 | __compiletime_assert_387
         | ^
>> fs/inode.c:2627:23: error: call to '__compiletime_assert_408' declared with 'error' attribute: Need native word sized stores/loads for atomicity.
    2627 |         ktime_t now, floor = smp_load_acquire(&ctime_floor);
         |                              ^
   include/asm-generic/barrier.h:176:29: note: expanded from macro 'smp_load_acquire'
     176 | #define smp_load_acquire(p) __smp_load_acquire(p)
         |                             ^
   include/asm-generic/barrier.h:151:2: note: expanded from macro '__smp_load_acquire'
     151 |         compiletime_assert_atomic_type(*p);                             \
         |         ^
   include/linux/compiler_types.h:513:2: note: expanded from macro 'compiletime_assert_atomic_type'
     513 |         compiletime_assert(__native_word(t),                            \
         |         ^
   note: (skipping 1 expansions in backtrace; use -fmacro-backtrace-limit=0 to see all)
   include/linux/compiler_types.h:498:2: note: expanded from macro '_compiletime_assert'
     498 |         __compiletime_assert(condition, msg, prefix, suffix)
         |         ^
   include/linux/compiler_types.h:491:4: note: expanded from macro '__compiletime_assert'
     491 |                         prefix ## suffix();                             \
         |                         ^
   <scratch space>:67:1: note: expanded from here
      67 | __compiletime_assert_408
         | ^
   fs/inode.c:2166:18: error: call to '__compiletime_assert_387' declared with 'error' attribute: Need native word sized stores/loads for atomicity.
    2166 |         ktime_t floor = smp_load_acquire(&ctime_floor);
         |                         ^
   include/asm-generic/barrier.h:176:29: note: expanded from macro 'smp_load_acquire'
     176 | #define smp_load_acquire(p) __smp_load_acquire(p)
         |                             ^
   include/asm-generic/barrier.h:151:2: note: expanded from macro '__smp_load_acquire'
     151 |         compiletime_assert_atomic_type(*p);                             \
         |         ^
   include/linux/compiler_types.h:513:2: note: expanded from macro 'compiletime_assert_atomic_type'
     513 |         compiletime_assert(__native_word(t),                            \
         |         ^
   note: (skipping 1 expansions in backtrace; use -fmacro-backtrace-limit=0 to see all)
   include/linux/compiler_types.h:498:2: note: expanded from macro '_compiletime_assert'
     498 |         __compiletime_assert(condition, msg, prefix, suffix)
         |         ^
   include/linux/compiler_types.h:491:4: note: expanded from macro '__compiletime_assert'
     491 |                         prefix ## suffix();                             \
         |                         ^
   <scratch space>:29:1: note: expanded from here
      29 | __compiletime_assert_387
         | ^
   fs/inode.c:2166:18: error: call to '__compiletime_assert_387' declared with 'error' attribute: Need native word sized stores/loads for atomicity.
   include/asm-generic/barrier.h:176:29: note: expanded from macro 'smp_load_acquire'
     176 | #define smp_load_acquire(p) __smp_load_acquire(p)
         |                             ^
   include/asm-generic/barrier.h:151:2: note: expanded from macro '__smp_load_acquire'
     151 |         compiletime_assert_atomic_type(*p);                             \
         |         ^
   include/linux/compiler_types.h:513:2: note: expanded from macro 'compiletime_assert_atomic_type'
     513 |         compiletime_assert(__native_word(t),                            \
         |         ^
   note: (skipping 1 expansions in backtrace; use -fmacro-backtrace-limit=0 to see all)
   include/linux/compiler_types.h:498:2: note: expanded from macro '_compiletime_assert'
     498 |         __compiletime_assert(condition, msg, prefix, suffix)
         |         ^
   include/linux/compiler_types.h:491:4: note: expanded from macro '__compiletime_assert'
     491 |                         prefix ## suffix();                             \
         |                         ^
   <scratch space>:29:1: note: expanded from here
      29 | __compiletime_assert_387
         | ^
   fs/inode.c:2166:18: error: call to '__compiletime_assert_387' declared with 'error' attribute: Need native word sized stores/loads for atomicity.
   include/asm-generic/barrier.h:176:29: note: expanded from macro 'smp_load_acquire'
     176 | #define smp_load_acquire(p) __smp_load_acquire(p)
         |                             ^
   include/asm-generic/barrier.h:151:2: note: expanded from macro '__smp_load_acquire'
     151 |         compiletime_assert_atomic_type(*p);                             \
         |         ^
   include/linux/compiler_types.h:513:2: note: expanded from macro 'compiletime_assert_atomic_type'
     513 |         compiletime_assert(__native_word(t),                            \
         |         ^
   note: (skipping 1 expansions in backtrace; use -fmacro-backtrace-limit=0 to see all)
   include/linux/compiler_types.h:498:2: note: expanded from macro '_compiletime_assert'
     498 |         __compiletime_assert(condition, msg, prefix, suffix)
         |         ^
   include/linux/compiler_types.h:491:4: note: expanded from macro '__compiletime_assert'
     491 |                         prefix ## suffix();                             \
         |                         ^
   <scratch space>:29:1: note: expanded from here
      29 | __compiletime_assert_387
         | ^
   fs/inode.c:2166:18: error: call to '__compiletime_assert_387' declared with 'error' attribute: Need native word sized stores/loads for atomicity.
   include/asm-generic/barrier.h:176:29: note: expanded from macro 'smp_load_acquire'
     176 | #define smp_load_acquire(p) __smp_load_acquire(p)
         |                             ^
   include/asm-generic/barrier.h:151:2: note: expanded from macro '__smp_load_acquire'
     151 |         compiletime_assert_atomic_type(*p);                             \
         |         ^
   include/linux/compiler_types.h:513:2: note: expanded from macro 'compiletime_assert_atomic_type'
     513 |         compiletime_assert(__native_word(t),                            \
         |         ^
   note: (skipping 1 expansions in backtrace; use -fmacro-backtrace-limit=0 to see all)
   include/linux/compiler_types.h:498:2: note: expanded from macro '_compiletime_assert'
     498 |         __compiletime_assert(condition, msg, prefix, suffix)
         |         ^
   include/linux/compiler_types.h:491:4: note: expanded from macro '__compiletime_assert'
     491 |                         prefix ## suffix();                             \
         |                         ^


vim +2627 fs/inode.c

  2608	
  2609	/**
  2610	 * inode_set_ctime_current - set the ctime to current_time
  2611	 * @inode: inode
  2612	 *
  2613	 * Set the inode's ctime to the current value for the inode. Returns
  2614	 * the current value that was assigned. If this is a not multigrain inode,
  2615	 * then we just set it to whatever the coarse_ctime is.
  2616	 *
  2617	 * If it is multigrain, then we first see if the coarse-grained
  2618	 * timestamp is distinct from what we have. If so, then we'll just use
  2619	 * that. If we have to get a fine-grained timestamp, then do so, and
  2620	 * try to swap it into the floor. We accept the new floor value
  2621	 * regardless of the outcome of the cmpxchg. After that, we try to
  2622	 * swap the new value into i_ctime_nsec. Again, we take the resulting
  2623	 * ctime, regardless of the outcome of the swap.
  2624	 */
  2625	struct timespec64 inode_set_ctime_current(struct inode *inode)
  2626	{
> 2627		ktime_t now, floor = smp_load_acquire(&ctime_floor);
  2628		struct timespec64 now_ts;
  2629		u32 cns, cur;
  2630	
  2631		now = coarse_ctime(floor);
  2632	
  2633		/* Just return that if this is not a multigrain fs */
  2634		if (!is_mgtime(inode)) {
  2635			now_ts = ktime_to_timespec64(now);
  2636			inode_set_ctime_to_ts(inode, now_ts);
  2637			goto out;
  2638		}
  2639	
  2640		/*
  2641		 * We only need a fine-grained time if someone has queried it,
  2642		 * and the current coarse grained time isn't later than what's
  2643		 * already there.
  2644		 */
  2645		cns = smp_load_acquire(&inode->i_ctime_nsec);
  2646		if (cns & I_CTIME_QUERIED) {
  2647			ktime_t ctime = ktime_set(inode->i_ctime_sec, cns & ~I_CTIME_QUERIED);
  2648	
  2649			if (!ktime_after(now, ctime)) {
  2650				ktime_t old, fine;
  2651	
  2652				/* Get a fine-grained time */
  2653				fine = ktime_get();
  2654	
  2655				/*
  2656				 * If the cmpxchg works, we take the new floor value. If
  2657				 * not, then that means that someone else changed it after we
  2658				 * fetched it but before we got here. That value is just
  2659				 * as good, so keep it.
  2660				 */
  2661				old = cmpxchg(&ctime_floor, floor, fine);
  2662				if (old != floor)
  2663					fine = old;
  2664				now = ktime_mono_to_real(fine);
  2665			}
  2666		}
  2667		now_ts = ktime_to_timespec64(now);
  2668	retry:
  2669		/* Try to swap the nsec value into place. */
  2670		cur = cmpxchg(&inode->i_ctime_nsec, cns, now_ts.tv_nsec);
  2671	
  2672		/* If swap occurred, then we're (mostly) done */
  2673		if (cur == cns) {
  2674			inode->i_ctime_sec = now_ts.tv_sec;
  2675		} else {
  2676			/*
  2677			 * Was the change due to someone marking the old ctime QUERIED?
  2678			 * If so then retry the swap. This can only happen once since
  2679			 * the only way to clear I_CTIME_QUERIED is to stamp the inode
  2680			 * with a new ctime.
  2681			 */
  2682			if (!(cns & I_CTIME_QUERIED) && (cns | I_CTIME_QUERIED) == cur) {
  2683				cns = cur;
  2684				goto retry;
  2685			}
  2686			/* Otherwise, keep the existing ctime */
  2687			now_ts.tv_sec = inode->i_ctime_sec;
  2688			now_ts.tv_nsec = cur & ~I_CTIME_QUERIED;
  2689		}
  2690	out:
  2691		return timestamp_truncate(now_ts, inode);
  2692	}
  2693	EXPORT_SYMBOL(inode_set_ctime_current);
  2694	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
