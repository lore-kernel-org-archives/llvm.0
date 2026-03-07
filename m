Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47AAB24E4A8;
	Sat,  7 Mar 2026 03:22:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772853756; cv=none; b=VLkbP/TXATxE5vpqYCrQIDVRE85tIsuConA3jtGoHyCL5hJWBcR1ZaUJRWYBJ0W1iQmcYeoVSxC0pb/TMAKxZufhlUVbLCNTp/WSousstq9zP+P7hFAUlrZBO/kuYnJRbomVOi5Z3fH4dGHw9FaQ/cZp1aAkE4CJdIHEaYQ0EHM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772853756; c=relaxed/simple;
	bh=IJYGxLQvo5RBA37r0plQxzWD3X8m6CU/REU/Oa3ImsY=;
	h=Date:From:To:Cc:Subject:Message-ID; b=ZaHfTAG4XPIRrdFgiRBVGyZFDZG+4memUmDdnw7b6TgSq4TcDqWPHtPhCfwuo+pyltKARmgRGzC66mDbjdqgqz6CQwjmmpT9fQ86hyTA3b6HIPRZlj3JMTfeauLEU6vOemw6SQEu+dRAV8xhBOUsRi/jUBCVpiNAq1BZn8z32MI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fxowY2rx; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fxowY2rx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1772853754; x=1804389754;
  h=date:from:to:cc:subject:message-id;
  bh=IJYGxLQvo5RBA37r0plQxzWD3X8m6CU/REU/Oa3ImsY=;
  b=fxowY2rxT4rWbxa0BYAYvisoscdR5XsOY4kIFue7WPDr4mtFUxx5lp1M
   qkXtpqi806dZN7+I0DNIucPBQIjmsWI6fRVcVBpEn9/wIqNDM/OxMLHNy
   wtsWd6w0+aVWxqTeunrsbh7i6IX15Qv5gthTLzFumXR8atU4dVyfcL2S2
   ne3kdd5lVj9Zd8E/1VwNLalxQp1cOznUgjTzrc6PDGl0HVqoYNO6mgfWn
   s3RntfBy9a2Jgw4uBrrzHGvQS+9dFbVMkKIvbXTSOaHImR842KV1mvKWz
   N7vuRQf0FxhuAcdNsBAuv+beumqXej+wIbB/mwZklpBLs44KxHseakPh9
   Q==;
X-CSE-ConnectionGUID: z8jnvrJPRJehIwJHvNhMrA==
X-CSE-MsgGUID: Maf7tGFXSc6Y1ZF0kkEDJA==
X-IronPort-AV: E=McAfee;i="6800,10657,11721"; a="61536499"
X-IronPort-AV: E=Sophos;i="6.23,106,1770624000"; 
   d="scan'208";a="61536499"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Mar 2026 19:22:33 -0800
X-CSE-ConnectionGUID: uSXcaqrpTRa6vquRdfH40g==
X-CSE-MsgGUID: QaTmk655S66WsV2o4jq7bQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,106,1770624000"; 
   d="scan'208";a="221973225"
Received: from lkp-server01.sh.intel.com (HELO 058beb05654c) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 06 Mar 2026 19:22:32 -0800
Received: from kbuild by 058beb05654c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vyiFJ-000000001dp-2sil;
	Sat, 07 Mar 2026 03:22:29 +0000
Date: Sat, 07 Mar 2026 11:21:59 +0800
From: kernel test robot <lkp@intel.com>
To: Peter Zijlstra <peterz@infradead.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [peterz-queue:locking/core 27/27]
 kernel/locking/rwsem.c:1295:3: warning: reading variable 'first_waiter'
 requires holding raw_spinlock '&rw_semaphore::wait_lock'
Message-ID: <202603071144.Fw81Ud9a-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/peterz/queue.git locking/core
head:   6f3cd442fa6c0cfc46a20c0138fb131daaa99d2d
commit: 6f3cd442fa6c0cfc46a20c0138fb131daaa99d2d [27/27] locking/rwsem: Add context analysis
config: sparc64-allmodconfig (https://download.01.org/0day-ci/archive/20260307/202603071144.Fw81Ud9a-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project c32caeec8158d634bb71ab8911a6031248b9fc47)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260307/202603071144.Fw81Ud9a-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603071144.Fw81Ud9a-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> kernel/locking/rwsem.c:1295:3: warning: reading variable 'first_waiter' requires holding raw_spinlock '&rw_semaphore::wait_lock' [-Wthread-safety-analysis]
    1295 |                 DEBUG_RWSEMS_WARN_ON(!is_rwsem_reader_owned(sem), sem);
         |                 ^
   kernel/locking/rwsem.c:75:10: note: expanded from macro 'DEBUG_RWSEMS_WARN_ON'
      75 |                 (sem)->first_waiter ? "" : "not "))             \
         |                        ^
   kernel/locking/rwsem.c:1322:2: warning: reading variable 'first_waiter' requires holding raw_spinlock '&rw_semaphore::wait_lock' [-Wthread-safety-analysis]
    1322 |         DEBUG_RWSEMS_WARN_ON(sem->magic != sem, sem);
         |         ^
   kernel/locking/rwsem.c:75:10: note: expanded from macro 'DEBUG_RWSEMS_WARN_ON'
      75 |                 (sem)->first_waiter ? "" : "not "))             \
         |                        ^
   kernel/locking/rwsem.c:1369:2: warning: reading variable 'first_waiter' requires holding raw_spinlock '&rw_semaphore::wait_lock' [-Wthread-safety-analysis]
    1369 |         DEBUG_RWSEMS_WARN_ON(sem->magic != sem, sem);
         |         ^
   kernel/locking/rwsem.c:75:10: note: expanded from macro 'DEBUG_RWSEMS_WARN_ON'
      75 |                 (sem)->first_waiter ? "" : "not "))             \
         |                        ^
   kernel/locking/rwsem.c:1383:2: warning: reading variable 'first_waiter' requires holding raw_spinlock '&rw_semaphore::wait_lock' [-Wthread-safety-analysis]
    1383 |         DEBUG_RWSEMS_WARN_ON(sem->magic != sem, sem);
         |         ^
   kernel/locking/rwsem.c:75:10: note: expanded from macro 'DEBUG_RWSEMS_WARN_ON'
      75 |                 (sem)->first_waiter ? "" : "not "))             \
         |                        ^
   kernel/locking/rwsem.c:1384:2: warning: reading variable 'first_waiter' requires holding raw_spinlock '&rw_semaphore::wait_lock' [-Wthread-safety-analysis]
    1384 |         DEBUG_RWSEMS_WARN_ON(!is_rwsem_reader_owned(sem), sem);
         |         ^
   kernel/locking/rwsem.c:75:10: note: expanded from macro 'DEBUG_RWSEMS_WARN_ON'
      75 |                 (sem)->first_waiter ? "" : "not "))             \
         |                        ^
   kernel/locking/rwsem.c:1389:2: warning: reading variable 'first_waiter' requires holding raw_spinlock '&rw_semaphore::wait_lock' [-Wthread-safety-analysis]
    1389 |         DEBUG_RWSEMS_WARN_ON(tmp < 0, sem);
         |         ^
   kernel/locking/rwsem.c:75:10: note: expanded from macro 'DEBUG_RWSEMS_WARN_ON'
      75 |                 (sem)->first_waiter ? "" : "not "))             \
         |                        ^
   kernel/locking/rwsem.c:1405:2: warning: reading variable 'first_waiter' requires holding raw_spinlock '&rw_semaphore::wait_lock' [-Wthread-safety-analysis]
    1405 |         DEBUG_RWSEMS_WARN_ON(sem->magic != sem, sem);
         |         ^
   kernel/locking/rwsem.c:75:10: note: expanded from macro 'DEBUG_RWSEMS_WARN_ON'
      75 |                 (sem)->first_waiter ? "" : "not "))             \
         |                        ^
   kernel/locking/rwsem.c:1410:2: warning: reading variable 'first_waiter' requires holding raw_spinlock '&rw_semaphore::wait_lock' [-Wthread-safety-analysis]
    1410 |         DEBUG_RWSEMS_WARN_ON((rwsem_owner(sem) != current) &&
         |         ^
   kernel/locking/rwsem.c:75:10: note: expanded from macro 'DEBUG_RWSEMS_WARN_ON'
      75 |                 (sem)->first_waiter ? "" : "not "))             \
         |                        ^
   kernel/locking/rwsem.c:1435:2: warning: reading variable 'first_waiter' requires holding raw_spinlock '&rw_semaphore::wait_lock' [-Wthread-safety-analysis]
    1435 |         DEBUG_RWSEMS_WARN_ON(rwsem_owner(sem) != current, sem);
         |         ^
   kernel/locking/rwsem.c:75:10: note: expanded from macro 'DEBUG_RWSEMS_WARN_ON'
      75 |                 (sem)->first_waiter ? "" : "not "))             \
         |                        ^
   9 warnings generated.


vim +1295 kernel/locking/rwsem.c

5dec94d4923683 Waiman Long 2019-05-20  1280  
5dec94d4923683 Waiman Long 2019-05-20  1281  /*
5dec94d4923683 Waiman Long 2019-05-20  1282   * lock for reading
5dec94d4923683 Waiman Long 2019-05-20  1283   */
92cc5d00a431e9 John Stultz 2023-05-03  1284  static __always_inline int __down_read_common(struct rw_semaphore *sem, int state)
5dec94d4923683 Waiman Long 2019-05-20  1285  {
3f5245538a1964 Waiman Long 2023-01-25  1286  	int ret = 0;
c8fe8b0564388f Waiman Long 2020-11-20  1287  	long count;
c8fe8b0564388f Waiman Long 2020-11-20  1288  
3f5245538a1964 Waiman Long 2023-01-25  1289  	preempt_disable();
c8fe8b0564388f Waiman Long 2020-11-20  1290  	if (!rwsem_read_trylock(sem, &count)) {
3f5245538a1964 Waiman Long 2023-01-25  1291  		if (IS_ERR(rwsem_down_read_slowpath(sem, count, state))) {
3f5245538a1964 Waiman Long 2023-01-25  1292  			ret = -EINTR;
3f5245538a1964 Waiman Long 2023-01-25  1293  			goto out;
3f5245538a1964 Waiman Long 2023-01-25  1294  		}
94a9717b3c40e7 Waiman Long 2019-05-20 @1295  		DEBUG_RWSEMS_WARN_ON(!is_rwsem_reader_owned(sem), sem);
5dec94d4923683 Waiman Long 2019-05-20  1296  	}
3f5245538a1964 Waiman Long 2023-01-25  1297  out:
3f5245538a1964 Waiman Long 2023-01-25  1298  	preempt_enable();
3f5245538a1964 Waiman Long 2023-01-25  1299  	return ret;
5dec94d4923683 Waiman Long 2019-05-20  1300  }
5dec94d4923683 Waiman Long 2019-05-20  1301  

:::::: The code at line 1295 was first introduced by commit
:::::: 94a9717b3c40e77a54e4afacd8f19a9a86bfeead locking/rwsem: Make rwsem->owner an atomic_long_t

:::::: TO: Waiman Long <longman@redhat.com>
:::::: CC: Ingo Molnar <mingo@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
